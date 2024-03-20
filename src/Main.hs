module Main where
import Models.Player
import Historia
import Loja
import MundoCidadela
import SistemaGold
import System.IO
import System.Directory
import qualified Models.Player


main::IO()
main = do

    putStrLn inicioHistoria
    escolha <- getLine
    escolha1 escolha

escolha1::String->IO()
escolha1 escolha01 = do

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
setupInicial = 

    --arquivo <- readFile' "src/pacote/Heroi.txt"
    --let heanes = read arquivo :: Models.Player.Player
    escolha2

fechaJogo::String
fechaJogo = "Você fugiu covardemente...Boa sorte em ensinar o Teorema do resto chinês."

menuInicial::String
menuInicial = "O que deseja fazer??\n(1) Explorar a cidade.\n(2) Seguir Carl Wilson."

escolha2::IO()
escolha2 = do
    putStrLn (textoFormatado menuInicial)
    escolha02 <- getLine

    if escolha02 == "1" then abreMapa01
    else if escolha02 == "2" then putStrLn cursoHistoria02
    else putStrLn "Escolha uma opção válida."
