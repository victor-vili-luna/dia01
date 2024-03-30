module Historia.Fase2(
    escolhaCaminhoCidadeFase2
) where
import Historia
import Loja
import SistemaGold
import Util.Lib

escolhaCaminhoCidadeFase2::IO()
escolhaCaminhoCidadeFase2 = do

    putStrLn  opcoesCidadela
    escolha02 <- getLine

    if trim escolha02 == "1" then do
        clearScreen
        putStrLn "Você escolheu explorar a cidade, para onde nosso bravo web-guerreiro irá?\n"
        abreMapa02 ["(1) Voltar a loja do ferreiro Ferreira para *ver* os itens disponíveis.", "(2) Conversar com o Ferreira.", "(3) Ir à praça da cidade.","(4) Ir tirar um cochilo." ]
    else if trim escolha02 == "2" then do
        clearScreen
        putStrLn cursoHistoria2
        historiaPrincipal ["(1) Ganhar dinheiro","(2) Comprar poções com C.W.","(3) Visitar o ferreiro Ferreira","(4) Me garanto em enfrentar a I.A."]
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
        historiaPrincipal ["(1) Ganhar dinheiro","(2) Comprar poções com C.W.","(3) Visitar o ferreiro Ferreira","(4) Me garanto em enfrentar a I.A."]
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
    else do 
        putStrLn "Digite uma opcão válida."
        historiaPrincipal opcoes
