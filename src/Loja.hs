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
    let lojaItem = map (read::String->Item) (lines arquivo02)
    print lojaItem
    compraItem lojaItem

abreLojaPocoesInicial::IO()
abreLojaPocoesInicial = do
    clearScreen

    putStrLn (textoFormatado "Ferreira, o ferreiro: Olá herói! Aqui está uma lista de poções que você pode comprar caso tenha as moedas, claro:\n")
    arquivoPocaoInicial <- readFile' "./src/pacote/PocaoInicial.txt"
    let pocao = read arquivoPocaoInicial :: Pocao
    print pocao
    putStrLn (textoFormatado "Deseja comprar algo?\n(1)Sim.\n(2)Não.")
    input <- getLine
    if input == "1" then compraPocao pocao
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
        print lojaItem
        putStrLn "\n"
        putStrLn "Digite o nome do item que você deseja comprar. Caso você esteja liso e não queira comprar nada, digite SAIR."
        compraItem lojaItem

compraPocao::Pocao->IO()
compraPocao pocao = do
    putStrLn "Digite o nome do item que você deseja comprar."
    input01 <- getLine
    if input01 == Models.Pocao.nome pocao then do
        arquivoHeroi <- readFile' "./src/pacote/Heroi.txt"
        let heanesPre = read arquivoHeroi :: Player
            gold = Models.Player.gold heanesPre
        if gold >= Models.Pocao.preco pocao then do
            let goldAtual = Models.Player.gold heanesPre - Models.Pocao.preco pocao
                heanesAdulto = heanesPre { gold = goldAtual, pocoes = pocoes heanesPre ++ [pocao] }
            writeFile "./src/pacote/Heroi.txt" (show heanesAdulto)
        else putStrLn "Está pobre, veja se tem outra coisa para comprar"
    else do 
        putStrLn "Por favor digite novamente."
        compraPocao pocao

verLoja::IO()
verLoja = do
    putStrLn "Esses são os itens e os preços que quando você trabalhar, poderá comprar: \n"
    arquivo02 <- readFile' "./src/pacote/ItensIniciais.txt"
    let loja = map (read::String->Item) (lines arquivo02)
    print loja
    putStrLn "\nMas como você ainda não possui nenhum tostão, acho melhor você pensar em fazer alguma outra coisa..."
    putStrLn "\n------------------------------------------------------------------------------------\n"



