module Loja where

import Models.Player
import Models.Item
import Historia
import Lib
import System.IO (readFile')
import Models.Pocao

abreLojaItensInicial::IO()
abreLojaItensInicial = do
    clearScreen

    putStrLn (textoFormatado "Ferreira, o ferreiro: Olá herói! Aqui está uma lista de itens que você pode comprar caso tenha as moedas, claro:\n")
    arquivo02 <- readFile' "./src/pacote/ItensIniciais.txt"
<<<<<<< HEAD
    let lojaItens = map (read::String->Item) (lines arquivo02)
    print lojaItens

--compraItem::[Item]->IO()
--compraItem lojaItens = do
    --putStrLn "Digite o nome do item que você deseja comprar."
    --input01 <- getLine
    --if input01 == Models.Pocao.nome pocao then do
        --arquivoHeroi <- readFile' "./src/pacote/Heroi.txt"
        --let heanesPre = read arquivoHeroi :: Player
            --gold = Models.Player.gold heanesPre
        --if gold >= Models.Pocao.preco pocao then do
            --let goldAtual = Models.Player.gold heanesPre - Models.Pocao.preco pocao
                --heanesAdulto = heanesPre { gold = goldAtual, pocoes = pocoes heanesPre ++ [pocao] }
            --writeFile "./src/pacote/Heroi.txt" (show heanesAdulto)
        --else putStrLn "Está pobre, veja se tem outra coisa para comprar"
    --else do 
        --putStrLn "Por favor digite novamente."
        --compraPocao pocao
=======
    let lojaItem = map (read::String->Item) (lines arquivo02)
    print lojaItem
    compraItem lojaItem
>>>>>>> f7d294508e49e89739e401e26b99373374e2c7b8

abreLojaPocoesInicial::IO()
abreLojaPocoesInicial = do
    clearScreen

    putStrLn (textoFormatado "Ferreira, o ferreiro: Olá herói! Aqui está uma lista de poções que você pode comprar caso tenha as moedas, claro:\n")
    arquivoPocaoInicial <- readFile' "./src/pacote/PocaoInicial.txt"
    let lojaPocao = map (read::String->Pocao) (lines arquivoPocaoInicial)
    print lojaPocao
    putStrLn (textoFormatado "Deseja comprar algo?\n(1)Sim.\n(2)Não.")
    input <- getLine
    if input == "1" then compraPocao lojaPocao
    else putStrLn "Não quer comprar hein...tudo bem."

compraItem::[Item]->IO()
compraItem lojaItem = do
    putStrLn "Digite o nome do item que você deseja comprar. Caso você esteja liso e não queira comprar nada, digite SAIR."
    input <- getLine
    if input == "SAIR" then do
        clearScreen
        putStrLn "ferreiro Ferreira: Não quer comprar hein... Tudo bem."
    else if (input == "Espada de ferro" || input == "Armadura de couro") then 
        putStrLn "AUUUUUUUUUUUUUUUUUUUUUU"
    else do 
        clearScreen
        putStrLn "ferreiro Ferreira: Não tenho esse item em estoque, os que eu tenho são esses:\n"
        print (lojaItem ++ "\n")
        putStrLn "Digite o nome do item que você deseja comprar. Caso você esteja liso e não queira comprar nada, digite SAIR."
        compraItem lojaItem

compraPocao::[Pocao]->IO()
compraPocao lojaPocao = do
    putStrLn "Digite o nome da pocao que você deseja comprar."
    input01 <- getLine
    let maybePocao = identificaPocao input01 lojaPocao
    case maybePocao of
        Just pocao -> do 
            arquivoHeroi <- readFile' "./src/pacote/Heroi.txt"
            let heanesPre = read arquivoHeroi :: Player
                gold = Models.Player.gold heanesPre
                precoPocao = Models.Pocao.preco pocao
            if gold >= precoPocao then
                if identificaPocaoJaComprada input01 (pocoes heanesPre) then do
                    let goldAtual = Models.Player.gold heanesPre - Models.Pocao.preco pocao
                        pocaoInicial = pegaPocao input01 (pocoes heanesPre)
                        quantidadeAtual = Models.Pocao.quantidade pocaoInicial + 1
                        pocaoFinal = pocaoInicial {quantidade = quantidadeAtual}    
                        heanesAdulto = heanesPre { gold = goldAtual}
                    writeFile "./src/pacote/Heroi.txt" (show heanesAdulto)
                    putStrLn "Compra realizada com sucesso."
                else do
                    let goldAtual = Models.Player.gold heanesPre - Models.Pocao.preco pocao
                        heanesAdulto = heanesPre { gold = goldAtual, pocoes = pocoes heanesPre ++ [pocao] }
                    writeFile "./src/pacote/Heroi.txt" (show heanesAdulto)
                    putStrLn "Compra realizada com sucesso."
            else do 
                putStrLn "Está pobre"
                abreLojaPocoesInicial
        Nothing -> do
            putStrLn "Por favor tente novamente"
            abreLojaPocoesInicial

identificaPocao::String->[Pocao]->Maybe Pocao
identificaPocao nomePocao [] = Nothing
identificaPocao nomePocao (pocao:pocaoSequente)
    | Models.Pocao.nome pocao == nomePocao = Just pocao
    | otherwise = identificaPocao nomePocao pocaoSequente

identificaPocaoJaComprada::String->[Pocao]->Bool
identificaPocaoJaComprada _ [] = False
identificaPocaoJaComprada nomePocao (a:as)
    | Models.Pocao.nome a == nomePocao = True
    | otherwise = identificaPocaoJaComprada nomePocao as

pegaPocao::String->[Pocao]->Pocao
pegaPocao _ [] = error "Poção errada"
pegaPocao nomePocao (a:as)
    | Models.Pocao.nome a == nomePocao = a
    | otherwise = pegaPocao nomePocao as

verLoja::IO()
verLoja = do
    putStrLn "Esses são os itens e os preços que quando você trabalhar, poderá comprar: \n"
    arquivo02 <- readFile' "./src/pacote/ItensIniciais.txt"
    let loja = map (read::String->Item) (lines arquivo02)
    print loja
    putStrLn "\nMas como você ainda não possui nenhum tostão, acho melhor você pensar em fazer alguma outra coisa..."
    putStrLn "\n------------------------------------------------------------------------------------\n"



