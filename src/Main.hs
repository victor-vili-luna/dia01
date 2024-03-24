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
    escolha1 escolha 0

escolha1::String-> Int -> IO()
escolha1 escolha vezes_negado = do

    clearScreen

    case escolha of
        "1" -> irSetupInicial

        "2" -> jubilado (vezes_negado + 1)


        _ -> do
            putStrLn "A liberdade de expressão era uma mentira..."
            irSetupInicial

jubilado :: Int -> IO ()
jubilado 8 = serJubilado
jubilado vezes_negado = do
    putStrLn "Pense melhor sobre isso professor..."
    putStrLn $ "(1) Sim, quero ajudar.\n" ++ "(2) " ++ concat (replicate vezes_negado "não ")
    escolha <- getLine
    escolha1 escolha vezes_negado

serJubilado :: IO()
serJubilado = do
    putStrLn $ "Heanes: Quantas vezes vou ter que repetir eu não quero fazer isso\n"
     ++ "Carl Wilson: Então você escolheu isso... não me culpe meu amigo\n *você foi ejetado para o limbo*"
    desbloqueaConquista "Jubilado"

irSetupInicial::IO ()
irSetupInicial = do
    putStrLn cursoParte01

setupInicial::IO()
setupInicial = do
    heroi <- readFile' "./src/pacote/Heroi.txt"
    let heanes = read heroi :: Models.Player.Player
    putStrLn (textoFormatado "...")
    escolha2

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
        combate
    else putStrLn "Escolha uma opção válida."
