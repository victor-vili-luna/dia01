module MundoCidadela where
import Historia
import Models.Local
import SistemaGold (sistemaGoldPassivoAux, sistemaGoldAtivoAux)

dialogoPadeiro01::String
dialogoPadeiro01 = textoFormatado "Você encontra uma padaria no caminho e decide conversar com o padeiro...\nVocê não notou nada de estranho Héroi?? Por que so você pode derrotar a I.A., e se assim, por que não tem todos os melhores itens?, tenha cuidado meu caro...\nHeanes: O que quer dizer com isso??\nPadeiro: Eu já falei demais... \n*Misterioresamente o homem que estava lá, desaparece aos olhos do professor.*\nO professor decide ignorar isso por enquanto, por enquanto."

dialogoFerreira01::String
dialogoFerreira01 = textoFormatado "Heanes: Tá mas se eu vou salvar o mundo por que você só não me dá os melhores itens de uma vez? Ferreira: *cerra os olhos e diz* Amigos amigos negócios à parte meu colega."

dialogoTrabalho01::String
dialogoTrabalho01 = textoFormatado "Olá meu amigo, vejo que C.W. o mandou para mim, bem, o que posso fazer por você??\nHeanes: Estou precisando de dinheiro para comprar algumas coisas...\nEntendo, entendo, bom. Existem duas formas:\n"

explicacaoBasica01::String
explicacaoBasica01 = textoFormatado "Então me ajude a carregar essas coisas aqui e dependendo de quantas vc levar, eu pago a quantia adequada."

explicacaoBasica02::String
explicacaoBasica02 = textoFormatado "Entendo entendo, pelo meio difícil hein, então responda a seguinte pergunta:"

abreMapa01 :: [String] -> IO()
abreMapa01 opcoes = do

    putStrLn "Finalmente no mundo aberto hein... O que quer explorar??"
    mapM_ putStrLn opcoes

    input <- getLine
    if input == "1" then do 
        --abreLoja
        abreMapa01 (removeOpcao "(1) Voltar a loja do Ferreiro Ferreira para ver os itens disponíveis." opcoes)
    else if input == "2" then do
        putStrLn dialogoFerreira01
        abreMapa01 (removeOpcao "(2) Conversar com o Ferreira." opcoes)
    else if input == "3" then do 
        putStrLn dialogoPadeiro01
        abreMapa01 (removeOpcao "(3) Ir a praça da cidade." opcoes)
    else if input == "4" then do
        putStrLn cursoHistoria02
        sistemaGold
    else putStrLn "Escreva uma opção válida."

removeOpcao::String->[String]->[String]
removeOpcao _ [] = []
removeOpcao opcao (a:as)
    | a == opcao = as
    | otherwise = a : removeOpcao opcao as 

sistemaGold :: IO ()
sistemaGold = do

    putStrLn "Heanes repentinamente é sumonado em um...TRABALHO???"
    putStrLn dialogoTrabalho01
    putStrLn "(1)Trabalhar ajudando a...\n(2)Responder enigmas que as IAs utilizam para afirmar sua superioridade."

    input <- getLine
    if input == "1" then do
        putStrLn explicacaoBasica01
        putStrLn "QUANDO QUISER PARAR, APERTE QUALQUER TECLA."
        sistemaGoldPassivoAux
        preLuta
    else if input == "2" then do
        putStrLn explicacaoBasica02
        sistemaGoldAtivoAux
        preLuta
    else do 
        putStrLn "Não quer trabalhar hein, tudo bem, vai lutar sem ajuda alguma, boa sorte Heanes.!"
        preLuta


preLuta::IO()
preLuta = do
    
    putStrLn "antierro"



