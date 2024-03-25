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

    putStrLn (textoFormatado "Aqui está uma lista de itens que atualmente voce pode comprar se tiver o dinheiro: ")
    arquivo02 <- readFile' "./src/pacote/ItensIniciais.txt"
    let lojaItem = map (read::String->Item) (lines arquivo02)
    print lojaItem

abreLojaPocoesInicial::IO()
abreLojaPocoesInicial = do
    clearScreen

    putStrLn (textoFormatado "Aqui está uma lista de pocoes que atualmente voce pode comprar se tiver o dinheiro: ")
    arquivoPocaoInicial <- readFile' "./src/pacote/PocaoInicial.txt"
    let pocao = read arquivoPocaoInicial :: Pocao
    print pocao
    putStrLn (textoFormatado "Deseja comprar algo?\n(1)Sim.\n(2)Não.")
    input <- getLine
    if input == "1" then compraPocao pocao
    else putStrLn "Não quer comprar hein...tudo bem."


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
    putStrLn "Esses são os itens e os preços que quando você trabalhar, poderá comprar: "
    arquivo02 <- readFile' "./src/pacote/ItensIniciais.txt"
    let loja = map (read::String->Item) (lines arquivo02)
    print loja



