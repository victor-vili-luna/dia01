module Loja where

import Models.Item
import Historia

abreLoja::IO()
abreLoja = do

    clearScreen

    putStrLn (textoFormatado "Aqui está uma lista de itens que atualmente voce pode comprar")
    arquivo02 <- readFile "dia01/src/pacote/LojaInicial.txt"
    let loja = map (read::String->Item) (lines arquivo02)
    print loja






