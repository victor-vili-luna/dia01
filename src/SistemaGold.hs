module SistemaGold where

import System.IO (hReady, stdin, readFile')
import Control.Concurrent(threadDelay)
import Historia
import Models.Player
import Lib

sistemaGoldPassivoAux::Int->IO()
sistemaGoldPassivoAux goldAntigo= do
    putStrLn "carregando caixas..."
    input <- hReady stdin
    if input then do
        throwinput <- getLine
        heroiAntigo <- readFile' "./src/pacote/Heroi.txt"
        let heanes = read heroiAntigo :: Player
            goldAtual = goldAntigo + 3
            heanes2 = heanes {Models.Player.gold=goldAtual}
        writeFile "./src/pacote/Heroi.txt" (show heanes2)
        clearScreen
        putStrLn("\nC.W.:Você se cansa rápido para um héroi...\n\n*Você olha para sua carteira de professor, e vê " ++ show(goldAtual) ++ " moedas de critais.*")
    else do 
        threadDelay(3*1000000)
        sistemaGoldPassivoAux (goldAntigo+3)

sistemaGoldAtivoAux::IO()
sistemaGoldAtivoAux = do

    clearScreen

    putStrLn questao01
    input <- getLine
    if (input /= "Haskell") && (input /= "haskell") then do
        conteudo <- readFile' "./src/pacote/Heroi.txt"
        let heanes = read conteudo :: Models.Player.Player
            goldAtual = gold heanes + 30
            heanes2 = heanes {Models.Player.gold=goldAtual}
        writeFile "./src/pacote/Heroi.txt" (show heanes2)
        clearScreen
        putStrLn $ "\nVending Machine: MUITO BEM, HUMANO! AINDA BEM QUE MEU PROGRAMADOR NÃO ME FEZ EM HASKELL... ECA!"
        putStrLn ("\n*Você olha para sua carteira de professor, e vê " ++ show(goldAtual) ++ " moedas de critais. Enquanto isso, o Mestre dos Magos é sumonado repentinamente*")
    else do
        clearScreen
        putStrLn "\nVending Machine: COMO VOCÊ PODE FALAR UMA COISA DESSAS??? REPENSE SUAS ATITUDEZINHAS, SEM REWARD PARA VOCÊ."
        putStrLn ("\n*Você olha para sua carteira de professor, e ela está vazia, você pensa em entrar em greve. Enquanto isso, o Mestre dos Magos é sumonado repentinamente*")

questao01::String
questao01 = textoFormatado "*Heanes se encaminha para um lugar de procedência duvidosa, lá ele encontra uma Vending Machine*\n\nVending Machine: OLÁ HUMANO! VOCÊ É CAPAZ DE RESPONDER A MINHA PERGUNTA? AQUI VAI ELA:\n\nVending Machine: QUAL A MELHOR LINGUAGEM DE PROGRAMAÇÃO JÁ CRIADA?\n"

questao02::String
questao02 = textoFormatado "q02"

questao03::String
questao03 = textoFormatado "q03"

questao04::String
questao04 = textoFormatado "q04"
