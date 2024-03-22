module Loja where

import Models.Item
import Historia (textoFormatado)

abreLoja::IO()
abreLoja = do
    putStrLn (textoFormatado "Aqui está uma lista de itens que atualmente voce pode comprar")
    arquivo02 <- readFile "dia01/src/pacote/LojaInicial.txt"
    let loja = map (read::String->Item) (lines arquivo02)
    print loja






