module Main where
import Models.Player
import Historia
import Loja
import MundoCidadela
import SistemaGold
import System.IO
import System.Directory
import qualified Models.Player
import Combate
import Lib

main::IO()
main = do

    putStrLn inicioHistoria
    escolha <- getLine
    escolha1 escolha

escolha1::String->IO()
escolha1 escolha01 = do

    clearScreen

    if escolha01 == "1" then do
        putStrLn cursoParte01
        setupInicial

    else if escolha01 == "2" then do 
        putStrLn "Você negou-se a ir?? Isso foi o limite de faltas...Seja jubilado desse mundo."
        putStrLn fechaJogo --Aguardando interacao de conquista.

    else do
        putStrLn "A liberdade de expressão era uma mentira..."
        putStrLn cursoParte01
        setupInicial 
    
setupInicial::IO()
setupInicial = do
    heroi <- readFile' "./src/pacote/Heroi.txt"
    let heanes = read heroi :: Models.Player.Player
    putStrLn (textoFormatado "...")
    escolha2

fechaJogo::String
fechaJogo = "Você fugiu covardemente...Boa sorte em ensinar o Teorema do resto chinês."

menuInicial::String
menuInicial = "O que deseja fazer??\n(1) Explorar a cidade.\n(2) Seguir Carl Wilson."

escolha2::IO()
escolha2 = do

    clearScreen

    putStrLn (textoFormatado menuInicial)
    escolha02 <- getLine

    if escolha02 == "1" then abreMapa01 ["(1) Voltar a loja do Ferreiro Ferreira para ver os itens disponíveis.", "(2) Conversar com o Ferreira.", "(3) Ir a praça da cidade.","(4) Seguir Carl Wilson." ]
    else if escolha02 == "2" then do
        putStrLn cursoHistoria02
        sistemaGold
    else putStrLn "Escolha uma opção válida."
