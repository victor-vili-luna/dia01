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

    clearScreen

    putStrLn inicioHistoria
    escolha <- getLine
    escolha1 escolha 0

escolha1::String-> Int -> IO()
escolha1 escolha vezes_negado = do

    clearScreen

    case escolha of
        "1" -> setupInicial
        "2" -> jubilado (vezes_negado + 1)
        _ -> do
            putStrLn "A liberdade de expressão era uma mentira..."
            setupInicial

jubilado :: Int -> IO ()
jubilado 8 = serJubilado
jubilado vezes_negado = do
    putStrLn "Pense melhor sobre isso professor...\n"
    putStrLn $ "(1) Sim, quero ajudar.\n" ++ "(2) " ++ concat (replicate vezes_negado "Não. ")
    escolha <- getLine
    escolha1 escolha vezes_negado

serJubilado :: IO()
serJubilado = do
    putStrLn $ "Heanes: Quantas vezes vou ter que repetir eu não quero fazer isso\n"
     ++ "Carl Wilson: Então você escolheu isso... não me culpe meu amigo\n *você foi ejetado para o limbo*"
    desbloqueaConquista "Jubilado"

setupInicial::IO()
setupInicial = do
    putStrLn cursoParte01
    heroi <- readFile' "./src/pacote/Heroi.txt"
    let heanes = read heroi :: Models.Player.Player
    putStrLn (textoFormatado "...")
    escolha2

menuInicial::String
menuInicial = "O que deseja fazer??\n(1) Explorar a cidade.\n(2) Seguir Carl Wilson.\n"

escolha2::IO()
escolha2 = do

    putStrLn (textoFormatado menuInicial)
    escolha02 <- getLine

    if escolha02 == "1" then abreMapa01 ["(1) Voltar a loja do Ferreiro Ferreira para *ver* os itens disponíveis.", "(2) Conversar com o Ferreira.", "(3) Ir a praça da cidade.","(4) Seguir Carl Wilson." ]
    else if escolha02 == "2" then do
        putStrLn cursoHistoria02
        putStrLn "Heanes repentinamente é sumonado em um...TRABALHO???"
        putStrLn dialogoTrabalho01
        sistemaGold
        historiaPrincipal ["(1)Ganhar dinheiro","(2)Comprar poções com C.W.","(3)Visitar o ferreiro Ferreira","(4)Me garanto em enfrentar a I.A."]
    else putStrLn "Escolha uma opção válida."
