module Historia.Fase1(
    escolhaCaminhoCidade
) where
import Historia
import Loja
import SistemaGold
import Combate
import Util.Lib

escolhaCaminhoCidade::IO()
escolhaCaminhoCidade = do

    putStrLn menuInicial
    escolha02 <- getLine

    if trim escolha02 == "1" then do
        clearScreen
        putStrLn "Você escolheu explorar a cidade, para onde nosso bravo web-guerreiro irá?\n"
        abreMapa01 ["(1) Voltar a loja do ferreiro Ferreira para *ver* os itens disponíveis.", "(2) Conversar com o Ferreira.", "(3) Ir à praça da cidade.","(4) Seguir Carl Wilson.","(5) voltar ao menu" ]
    else if trim escolha02 == "2" then do
        clearScreen
        putStrLn "*Carl Wilson percebe que você começa a seguir ele e se vira rapidamente em sua direção*\n"
        putStrLn cursoHistoria1
        sistemaGold
        historiaPrincipal ["(1) Ganhar dinheiro","(2) Comprar poções com C.W.","(3) Visitar o ferreiro Ferreira","(4) Me garanto em enfrentar a I.A.","(5) Voltar para o menu"]
    else if trim escolha02 == "3" then 
        voltaMenu
    else do
        putStrLn "Escolha uma opção válida."
        escolhaCaminhoCidade

abreMapa01 :: [String] -> IO()
abreMapa01 opcoes = do

    mapM_ putStrLn opcoes

    putStrLn "\n------------------------------------------------------------------------------------\n"

    input <- getLine
    let resposta = trim input
    if resposta == "1" then do
        clearScreen
        verLoja
        putStrLn "\nMas como você ainda não possui nenhum tostão, acho melhor você pensar em fazer alguma outra coisa..."
        putStrLn (textoFormatado "")
        abreMapa01 opcoes
    else if resposta == "2" then do
        clearScreen
        putStrLn dialogoFerreira01
        abreMapa01 opcoes
    else if resposta == "3" then do
        clearScreen
        putStrLn dialogoPadeiro01
        abreMapa01 opcoes
    else if resposta == "4" then do
        clearScreen
        putStrLn cursoHistoria1
        sistemaGold
        putStrLn cursoAventura01
        historiaPrincipal ["(1) Ganhar dinheiro","(2) Comprar poções com C.W.","(3) Visitar o ferreiro Ferreira","(4) Me garanto em enfrentar a I.A.","(5) Voltar ao menu"]
    else if resposta == "5" then 
        voltaMenu
    else do
        putStrLn "Escreva uma opção válida."
        abreMapa01 opcoes

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
        abreLojaItens itemInicial
        historiaPrincipal opcoes
    else if opcaoJogador == "4" then do
        clearScreen
        combate01
    else if opcaoJogador == "5" then
        voltaMenu
    else do 
        putStrLn "Digite uma opcão válida."
        historiaPrincipal opcoes

