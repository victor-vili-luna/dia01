module MundoCidadela where
import Historia
import SistemaGold (sistemaGoldPassivoAux, sistemaGoldAtivoAux)
import Combate
import Loja
import Models.Player
import System.IO (readFile')
import Lib

dialogoPadeiro01::String
dialogoPadeiro01 = textoFormatado "\n*Você encontra a Panificadora Alfa no caminho e decide conversar com o padeiro...*\n\nPadeiro: HoHoHo, Você não notou nada de estranho, Héroi?? Tenha cuidado, nem todos na Cidadela de Critais são confiáveis...\n\nHeanes: O que quer dizer com isso??\nPadeiro: Lembre-se disso: लोहार पर भरोसा मत करो... \n\n*Misterioresamente o homem que estava lá, desaparece aos olhos do professor.*\n\n*O professor decide ignorar isso por enquanto. Por enquanto...*"

dialogoFerreira01::String
dialogoFerreira01 = textoFormatado "\nHeanes: Ferreira, se eu vou salvar o mundo, por que você só não me dá os melhores itens de uma vez?\n\nFerreira: *cerra os olhos e diz* Negócios são negócios, como vou pagar o meu café que tomo em seu Élho?\n\n*Ferreira não está mais aberto a conversas, acho melhor fazer alguma outra coisa decente*\n"

explicacaoBasica01::String
explicacaoBasica01 = textoFormatado "\nC.W.: Ótimo! Então me ajude a carregar essas caixas, e dependendo de quantas você levar, eu pago a quantia adequada.\n"

cursoAventura01::String
cursoAventura01 = textoFormatado "\nC.W.: Bom, agora que você já está mais orientado nessa bela cidadela, recomendo ir atrás de algumas informações sobre as I.As, Quem pode te ajudar nisso é o Leandro.\n\nHeanes: Que Leandro??\n\nC.W.: Leandro Da Vinci.\n"

abreMapa01 :: [String] -> IO()
abreMapa01 opcoes = do

    mapM_ putStrLn opcoes

    putStrLn "\n------------------------------------------------------------------------------------\n"

    input <- getLine
    if input == "1" then do
        clearScreen
        verLoja
        abreMapa01 (removeOpcao "(1) Voltar a loja do ferreiro Ferreira para *ver* os itens disponíveis." opcoes)
    else if input == "2" then do
        clearScreen
        putStrLn dialogoFerreira01
        abreMapa01 (removeOpcao "(2) Conversar com o Ferreira." opcoes)
    else if input == "3" then do
        clearScreen
        putStrLn dialogoPadeiro01
        abreMapa01 (removeOpcao "(3) Ir à praça da cidade." opcoes)
    else if input == "4" then do
        clearScreen
        putStrLn cursoHistoria02
        sistemaGold
        putStrLn cursoAventura01
        historiaPrincipal ["(1) Ganhar dinheiro","(2) Comprar poções com C.W.","(3) Visitar o ferreiro Ferreira","(4) Me garanto em enfrentar a I.A."]
    else do
        putStrLn "Escreva uma opção válida."
        abreMapa01 opcoes

sistemaGold :: IO ()
sistemaGold = do

    putStrLn "(1) Trabalhar ajudando a carregar alguns suprimentos para um mercado mágico próximo.\n(2) Responder enigmas que as IAs utilizam para afirmar sua superioridade.\n(3) N.D.A."
    putStrLn "\n------------------------------------------------------------------------------------\n"

    input <- getLine
    if input == "1" then do
        clearScreen
        putStrLn explicacaoBasica01
        putStrLn "*QUANDO QUISER PARAR, APERTE QUALQUER TECLA.*"
        conteudo <- readFile' "./src/pacote/Heroi.txt"
        let heanes = read conteudo :: Player
        sistemaGoldPassivoAux (gold heanes)
    else if input == "2" then do
        clearScreen
        sistemaGoldAtivoAux ["(1)","(2)","(3)","(4)"]
    else do
        clearScreen
        putStrLn "Não quer trabalhar hein, tudo bem. Boa sorte!"

historiaPrincipal::[String]->IO()
historiaPrincipal opcoes02 = do

    putStrLn "O que deseja fazer agora que está de volta a cidade?\n"
    mapM_ putStrLn opcoes02
    putStrLn "\n------------------------------------------------------------------------------------\n"

    opcaoJogador <- getLine
    if opcaoJogador == "1" then do
        clearScreen
        putStrLn "Ganhar alguns mangos sempre é bom, talvez assim nosso herói não precise aderir a nenhuma greve. Como iremos angariar fundos?\n"
        sistemaGold
        historiaPrincipal (removeOpcao "(1) Ganhar dinheiro" opcoes02)
    else if opcaoJogador == "2" then do
        clearScreen
        abreLojaPocoesInicial
        historiaPrincipal (removeOpcao "(2) Comprar poções com C.W." opcoes02)
    else if opcaoJogador == "3" then do
        clearScreen
        abreLojaItensInicial
        historiaPrincipal (removeOpcao "(3) Visitar o ferreiro Ferreira" opcoes02)
    else if opcaoJogador == "4" then do
        clearScreen
        combate01
    else do 
        putStrLn "Digite uma opcão válida."
        historiaPrincipal opcoes02