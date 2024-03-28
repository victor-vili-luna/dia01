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
import Util.Lib
import Util.ControleSalvamento

main::IO()
main = do

    clearScreen
    menu

comecoHistoria::IO()
comecoHistoria = do
    clearScreen
    putStrLn inicioHistoria1
    esperandoEnter
    clearScreen
    putStrLn inicioHistoria2
    esperandoEnter
    clearScreen
    putStrLn inicioHistoria3
    esperandoEnter
    clearScreen
    putStrLn inicioHistoria4
    esperandoEnter
    clearScreen
    putStrLn inicioHistoria5
    escolha <- getLine
    escolhaTreatment escolha 0

escolhaTreatment::String-> Int -> IO()
escolhaTreatment escolha vezes_negado = do

    clearScreen

    case escolha of
        "1" -> do
            setupInicial
        "2" -> jubilado (vezes_negado + 1)
        _ -> do
            putStrLn "A liberdade de expressão era uma mentira...\n"
            esperandoEnter
            setupInicial

jubilado ::Int -> IO ()
jubilado 8 = serJubilado
jubilado vezes_negado = do
    putStrLn "Pense melhor sobre isso professor...\n"
    putStrLn $ "(1) Sim, quero ajudar.\n" ++ "(2) " ++ concat (replicate vezes_negado "Não. ")
    putStrLn "\n------------------------------------------------------------------------------------\n"
    escolha <- getLine
    escolhaTreatment escolha vezes_negado

serJubilado :: IO()
serJubilado = do
    putStrLn $ "Heanes: Quantas vezes vou ter que repetir eu não quero fazer isso???\n\n"
     ++ "Carl Wilson: Então você escolheu isso... não me culpe meu amigo\n\n*você foi ejetado para o limbo*\n"
    desbloqueaConquista "Jubilado"

setupInicial::IO()
setupInicial = do
    clearScreen
    putStrLn cursoParte01
    esperandoEnter
    clearScreen
    putStrLn cursoParte02
    esperandoEnter
    clearScreen
    putStrLn cursoParte03
    esperandoEnter
    clearScreen
    putStrLn cursoParte04
    esperandoEnter
    clearScreen
    putStrLn cursoParte05
    esperandoEnter
    clearScreen
    putStrLn cursoParte06
    esperandoEnter
    clearScreen
    putStrLn cursoParte07
    esperandoEnter
    clearScreen
    escolha2

menuInicial::String
menuInicial = "O que você deseja fazer??\n\n(1) Explorar a cidade.\n(2) Seguir Carl Wilson.\n"

escolha2::IO()
escolha2 = do

    putStrLn (textoFormatado menuInicial)
    escolha02 <- getLine

    if escolha02 == "1" then do
        clearScreen
        putStrLn "Você escolheu explorar a cidade, para onde nosso bravo web-guerreiro irá?\n"
        abreMapa01 ["(1) Voltar a loja do ferreiro Ferreira para *ver* os itens disponíveis.", "(2) Conversar com o Ferreira.", "(3) Ir à praça da cidade.","(4) Seguir Carl Wilson." ]
    else if escolha02 == "2" then do
        clearScreen
        putStrLn "*Carl Wilson percebe que você começa a seguir ele e se vira rapidamente em sua direção*\n"
        putStrLn cursoHistoria02
        sistemaGold
        historiaPrincipal ["(1) Ganhar dinheiro","(2) Comprar poções com C.W.","(3) Visitar o ferreiro Ferreira","(4) Me garanto em enfrentar a I.A."]
    else do
        putStrLn "Escolha uma opção válida."
        escolha2


menu :: IO ()
menu = do
    putStrLn "Bem-vindo a Fábulas de Magia : Cidadela de Cristal, mais conhecido como FMCC "
    putStrLn (textoFormatado "")
    putStrLn "Escolha uma opção:"
    putStrLn "1 - Começar o jogo"
    putStrLn "2 - Carregar o jogo"
    putStrLn "3 - Ajuda"
    putStrLn "4 - Sair\n"

    input <- getLine

    case input of
        "1" -> do
            clearScreen
            comecaJogo
            comecoHistoria
        "2" -> putStrLn "carregaJogo"
        "3" -> do
            clearScreen
            help
            esperandoEnter
            clearScreen
            menu
        "4" -> do
            clearScreen
            putStrLn fechaJogo
        _   -> do
            clearScreen
            putStrLn "Opção inválida. Por favor, escolha uma opção válida.\n"
            esperandoEnter
            clearScreen
            menu
