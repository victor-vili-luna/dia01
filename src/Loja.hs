module Loja where

import Models.Item
import Historia
import Lib
import System.IO (readFile')
import Models.Pocao

abreLojaItensInicial::IO()
abreLojaItensInicial = do
    clearScreen

    putStrLn (textoFormatado "Aqui está uma lista de itens que atualmente voce pode comprar: ")
    arquivo02 <- readFile' "./src/pacote/LojaInicial.txt"
    let lojaItem = map (read::String->Item) (lines arquivo02)
    print lojaItem

abreLojaPocoesInicial::IO()
abreLojaPocoesInicial = do
    clearScreen

    putStrLn (textoFormatado "Aqui está uma lista de pocoes que atualmente voce pode comprar: ")
    arquivoPocaoInicial <- readFile' ".src/pacote/PocaoInicial.txt"
    let pocao = map (read::String->Pocao) (lines arquivoPocaoInicial)
    print pocao

verLoja::IO()
verLoja = do
    putStrLn "Esses são os itens e os preços que quando você trabalhar, poderá comprar: "
    arquivo02 <- readFile' "./src/pacote/LojaInicial.txt"
    let loja = map (read::String->Item) (lines arquivo02)
    print loja



