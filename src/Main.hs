module Main where
import Models.Player
import Historia
import Loja
import SistemaGold
import System.IO
import System.Directory
import Combate
import Util.Lib
import Util.ControleSalvamento
import Historia.Fase1

main::IO()
main = menu

menu :: IO ()
menu = do
    clearScreen
    putStrLn "Bem-vindo a Fábulas de Magia : Cidadela de Cristal, mais conhecido como FMCC "
    putStrLn (textoFormatado "")
    putStrLn "Escolha uma opção:"
    putStrLn "1 - Começar o jogo"
    putStrLn "2 - Carregar o jogo"
    putStrLn "3 - Ajuda"
    putStrLn "4 - Sair\n"

    input <- getLine
    clearScreen
    case input of
        "1" -> do
            comecaJogo
        "2" -> carregaJogo
        "3" -> do
            help
            esperandoEnter
            clearScreen
            menu
        "4" -> do
            
            putStrLn fechaJogo
        _   -> do
            putStrLn "Opção inválida. Por favor, escolha uma opção válida.\n"
            esperandoEnter
            clearScreen
            menu

