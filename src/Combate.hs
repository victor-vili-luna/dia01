module Combate where
import Util.Lib
import Loja

preCombate::IO()
preCombate = do
    
    putStrLn "Antes de prosseguir para o combate, tem certeza que não quer comprar mais nenhum item ou pocao?"
    putStrLn "(1)Comprar poções com C.W.\n(2)Visitar o ferreiro Ferreira.\n(3)Me garanto."

preCombate02::IO()
preCombate02 = do

    clearScreen
    putStrLn "Parece que voce nao quis trabalhar ein hahaha, vai sem item nenhum e sem pocoes, acerte tudo e mesmo assim morrerá!"

combate01::IO()
combate01 = do
    putStrLn "antierro"