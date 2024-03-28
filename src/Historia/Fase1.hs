module Historia.Fase1(
    menu
) where
import Models.Player
import Historia
import Loja
import SistemaGold
import System.IO
import System.Directory
import qualified Models.Player
import Combate
import Util.Lib
import Util.ControleSalvamento

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
            comecoHistoria
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

comecoHistoria::IO()
comecoHistoria = do
    mapM_ printString [inicioHistoria1, inicioHistoria2, inicioHistoria3, inicioHistoria4]
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


setupInicial::IO()
setupInicial = do
    mapM_ printString [cursoParte01, cursoParte02, cursoParte03, cursoParte04, cursoParte05, cursoParte06, cursoParte07]
    clearScreen
    escolhaCaminhoCidade

serJubilado :: IO()
serJubilado = do
    putStrLn $ "Heanes: Quantas vezes vou ter que repetir eu não quero fazer isso???\n\n"
     ++ "Carl Wilson: Então você escolheu isso... não me culpe meu amigo\n\n*você foi ejetado para o limbo*\n"
    desbloqueaConquista "Jubilado"

jubilado ::Int -> IO ()
jubilado 8 = serJubilado
jubilado vezes_negado = do
    putStrLn "Pense melhor sobre isso professor...\n"
    putStrLn $ "(1) Sim, quero ajudar.\n" ++ "(2) " ++ concat (replicate vezes_negado "Não. ")
    putStrLn "\n------------------------------------------------------------------------------------\n"
    escolha <- getLine
    escolhaTreatment escolha vezes_negado

escolhaCaminhoCidade::IO()
escolhaCaminhoCidade = do

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
        escolhaCaminhoCidade

abreMapa01 :: [String] -> IO()
abreMapa01 opcoes = do

    mapM_ putStrLn opcoes

    putStrLn "\n------------------------------------------------------------------------------------\n"

    input <- getLine
    if input == "1" then do
        clearScreen
        verLoja
        abreMapa01 opcoes
    else if input == "2" then do
        clearScreen
        putStrLn dialogoFerreira01
        abreMapa01 opcoes
    else if input == "3" then do
        clearScreen
        putStrLn dialogoPadeiro01
        abreMapa01 opcoes
    else if input == "4" then do
        clearScreen
        putStrLn cursoHistoria02
        sistemaGold
        putStrLn cursoAventura01
        historiaPrincipal ["(1) Ganhar dinheiro","(2) Comprar poções com C.W.","(3) Visitar o ferreiro Ferreira","(4) Me garanto em enfrentar a I.A."]
    else do
        putStrLn "Escreva uma opção válida."
        abreMapa01 opcoes

printString:: String -> IO()
printString texto = do
    clearScreen
    putStrLn texto
    esperandoEnter

historiaPrincipal::[String]->IO()
historiaPrincipal opcoes = do

    putStrLn "O que deseja fazer agora que está de volta a cidade?\n"
    mapM_ putStrLn opcoes
    putStrLn "\n------------------------------------------------------------------------------------\n"

    opcaoJogador <- getLine
    if opcaoJogador == "1" then do
        clearScreen
        putStrLn "Ganhar alguns mangos sempre é bom, talvez assim nosso herói não precise aderir a nenhuma greve. Como iremos angariar fundos?\n"
        sistemaGold
        historiaPrincipal opcoes
    else if opcaoJogador == "2" then do
        clearScreen
        abreLojaPocoesInicial
        historiaPrincipal opcoes
    else if opcaoJogador == "3" then do
        clearScreen
        abreLojaItensInicial
        historiaPrincipal opcoes
    else if opcaoJogador == "4" then do
        clearScreen
        combate01
    else do 
        putStrLn "Digite uma opcão válida."
        historiaPrincipal opcoes

