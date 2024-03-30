module Historia.Fase2(
    escolhaCaminhoCidadeFase2
) where
import Historia
import Loja
import SistemaGold
import Combate
import Util.Lib
import CombateGPT

escolhaCaminhoCidadeFase2::IO()
escolhaCaminhoCidadeFase2 = do

    putStrLn  opcoesCidadela
    escolha02 <- getLine

    if trim escolha02 == "1" then do
        clearScreen
        putStrLn "Você escolheu explorar a cidade, para onde nosso bravo web-guerreiro irá?\n"
        abreMapa02 ["(1) Voltar a loja do ferreiro Ferreira para *ver* os itens disponíveis.", "(2) Conversar com o Ferreira.", "(3) Ir à praça da cidade.","(4) Ir tirar um cochilo.","(5) Voltar ao menu" ]
    else if trim escolha02 == "2" then do
        clearScreen
        putStrLn cursoHistoria2
        historiaPrincipal ["(1) Ganhar dinheiro","(2) Comprar poções com C.W.","(3) Visitar o ferreiro Ferreira","(4) Me garanto em enfrentar a I.A.","(5) Voltar ao menu"]
    else if trim escolha02 == "3" then
        voltaMenu
    else do
        putStrLn "Escolha uma opção válida."
        escolhaCaminhoCidadeFase2

abreMapa02 :: [String] -> IO()
abreMapa02 opcoes = do

    mapM_ putStrLn opcoes

    putStrLn "\n------------------------------------------------------------------------------------\n"

    input <- getLine
    let resposta = trim input
    if resposta == "1" then do
        clearScreen
        verLoja
        abreMapa02 opcoes
    else if resposta == "2" then do
        clearScreen
        putStrLn dialogoFerreira02
        abreMapa02 opcoes
    else if resposta == "3" then do
        clearScreen
        putStrLn dialogoLeandro01
        abreMapa02 opcoes
    else if resposta == "4" then do
        clearScreen
        putStrLn cursoHistoria2
        historiaPrincipal ["(1) Ganhar dinheiro","(2) Comprar poções com C.W.","(3) Visitar o ferreiro Ferreira","(4) Me garanto em enfrentar a I.A.", "(5) Voltar ao menu"]
    else if resposta == "5" then
        voltaMenu
    else do
        putStrLn "Escreva uma opção válida."
        abreMapa02 opcoes

historiaPrincipal::[String]->IO()
historiaPrincipal opcoes = do
    putStrLn "O que deseja fazer agora que está de volta a cidade?\n"
    mapM_ putStrLn opcoes
    putStrLn "\n------------------------------------------------------------------------------------\n"

    input <- getLine
    let opcaoJogador = trim input
    if opcaoJogador == "1" then do
        clearScreen
        putStrLn "Ganhar alguns mangos sempre é bom, talvez assim nosso herói não precise aderir a nenhuma greve. Como iremos angariar fundos?\n"
        sistemaGold
        historiaPrincipal opcoes
    else if opcaoJogador == "2" then do
        clearScreen
        abreLojaPocoes pocaoInicial
        historiaPrincipal opcoes
    else if opcaoJogador == "3" then do
        clearScreen
        abreLojaItens itemFinal
        historiaPrincipal opcoes
    else if opcaoJogador == "4" then do
        clearScreen
        putStrLn "combate02"
    else if opcaoJogador == "5" then
        voltaMenu
    else do 
        putStrLn "Digite uma opcão válida."
        historiaPrincipal opcoes


kanvaCW :: IO()
kanvaCW = do
        putStrLn "CW: Parabéns pela vitória héroi, eu estava assistindo de longe, tamanha destreza sim, vou liberar uma ultima pocao para voce, mas ela é muito mais cara. Mas será absolutamente necessária se quiser derrotar o inominável, boa sorte na sua última aventura professor, se não me engano o ferreiro estava querendo falar com você." 
        posKanva

posKanva :: IO()
posKanva = do
        putStrLn "(1) Ganhar dinheiro.\n(2) Visitar o ferreiro Ferreira\n(3) Ver a nova poção.\n(4) Investigar o inominável."
        input <- getLine
        
        if trim input == "1" then do
            clearScreen
            sistemaGold
        else if trim input == "2" then do
            clearScreen
            abreLojaItens itemFinal
            posKanva
        else if trim input == "3" then do
            clearScreen
            abreLojaPocoes pocaoFinal
            posKanva
        else if trim input == "4" then do
            clearScreen
            putStr historiaConversaGPT
            combateGPT01
        else do
            clearScreen
            putStrLn "Digite uma opção válida."