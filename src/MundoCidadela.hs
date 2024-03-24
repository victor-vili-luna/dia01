module MundoCidadela where
import Historia
import SistemaGold (sistemaGoldPassivoAux, sistemaGoldAtivoAux)
import Combate
import Loja
import Models.Player
import System.IO (readFile')
import Lib

dialogoPadeiro01::String
dialogoPadeiro01 = textoFormatado "\nVocê encontra uma padaria no caminho e decide conversar com o padeiro...\nPadeiro: Você não notou nada de estranho Héroi?? Por que so você pode derrotar a I.A., e se assim, por que não tem todos os melhores itens?, tenha cuidado meu caro...\nHeanes: O que quer dizer com isso??\nPadeiro: Eu já falei demais... \n*Misterioresamente o homem que estava lá, desaparece aos olhos do professor.*\nO professor decide ignorar isso por enquanto, por enquanto."

dialogoFerreira01::String
dialogoFerreira01 = textoFormatado "\nHeanes: Tá mas se eu vou salvar o mundo por que você só não me dá os melhores itens de uma vez? Ferreira: *cerra os olhos e diz* Amigos amigos negócios à parte meu colega."

dialogoTrabalho01::String
dialogoTrabalho01 = textoFormatado "\nOlá meu amigo, vejo que C.W. o mandou para mim, bem, o que posso fazer por você??\nHeanes: Estou precisando de dinheiro para comprar algumas coisas...\nEntendo, entendo, bom. Existem duas formas:\n"

explicacaoBasica01::String
explicacaoBasica01 = textoFormatado "\nEntão me ajude a carregar essas coisas aqui e dependendo de quantas vc levar, eu pago a quantia adequada."

explicacaoBasica02::String
explicacaoBasica02 = textoFormatado "\nEntendo entendo, pelo meio difícil hein, então responda a seguinte pergunta:"

cursoAventura01::String
cursoAventura01 = textoFormatado "\nC.W.: Bom, agora que você conhece as mecânicas básicas do jogo, recomendo ir atrás de algumas informações sobre as I.As, tudo que eu sei sobre a sua primeira I.A. é que você pode ser ajudado pelo Leandro.\nHeanes: Que Leandro??\nC.W.:Da vinci."

abreMapa01 :: [String] -> IO()
abreMapa01 opcoes = do

    mapM_ putStrLn opcoes

    input <- getLine
    if input == "1" then do
        clearScreen
        verLoja
        abreMapa01 (removeOpcao "(1) Voltar a loja do Ferreiro Ferreira para *ver* os itens disponíveis." opcoes)
    else if input == "2" then do
        clearScreen
        putStrLn dialogoFerreira01
        abreMapa01 (removeOpcao "(2) Conversar com o Ferreira." opcoes)
    else if input == "3" then do
        clearScreen
        putStrLn dialogoPadeiro01
        abreMapa01 (removeOpcao "(3) Ir a praça da cidade." opcoes)
    else if input == "4" then do
        clearScreen
        putStrLn cursoHistoria02
        sistemaGold
        putStrLn cursoAventura01
        historiaPrincipal ["(1)Ganhar dinheiro","(2)Comprar poções com C.W.","(3)Visitar o ferreiro Ferreira","(4)Me garanto em enfrentar a I.A."]
    else do
        putStrLn "Escreva uma opção válida."
        abreMapa01 opcoes

removeOpcao::String->[String]->[String]
removeOpcao _ [] = []
removeOpcao opcao (a:as)
    | a == opcao = as
    | otherwise = a : removeOpcao opcao as

sistemaGold :: IO ()
sistemaGold = do

    putStrLn "(1)Trabalhar ajudando a carregar alguns suprimentos para um mercado mágico próximo.\n(2)Responder enigmas que as IAs utilizam para afirmar sua superioridade.\n(3)N.D.A."

    input <- getLine
    if input == "1" then do
        putStrLn explicacaoBasica01
        putStrLn "QUANDO QUISER PARAR, APERTE QUALQUER TECLA."
        conteudo <- readFile' "./src/pacote/Heroi.txt"
        let heanes = read conteudo :: Player
        sistemaGoldPassivoAux (gold heanes)
    else if input == "2" then do
        putStrLn explicacaoBasica02
        sistemaGoldAtivoAux
    else putStrLn "\nNão quer trabalhar hein, tudo bem. Boa sorte!"

historiaPrincipal::[String]->IO()
historiaPrincipal opcoes02 = do

    putStrLn "O que deseja fazer agora que está de volta a cidade?"
    mapM_ putStrLn opcoes02

    opcaoJogador <- getLine
    if opcaoJogador == "1" then do
        clearScreen
        sistemaGold
        historiaPrincipal (removeOpcao "(1)Ganhar dinheiro" opcoes02)
    else if opcaoJogador == "2" then do
        clearScreen
        abreLojaPocoesInicial
        historiaPrincipal (removeOpcao "(2)Comprar poções com C.W." opcoes02)
    else if opcaoJogador == "3" then do
        clearScreen
        abreLojaItensInicial
        historiaPrincipal (removeOpcao "(3)Visitar o ferreiro Ferreira" opcoes02)
    else if opcaoJogador == "4" then do
        clearScreen
        combate01
    else do 
        putStrLn "Digite uma opcão válida."
        historiaPrincipal opcoes02