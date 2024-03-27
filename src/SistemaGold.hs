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
        putStrLn ("\nC.W.:Você se cansa rápido para um héroi...\n\n*Você olha para sua carteira de professor, e vê " ++ show (goldAtual) ++ " moedas de critais.*")
    else do
        threadDelay (3*1000000)
        sistemaGoldPassivoAux (goldAntigo+3)

sistemaGoldAtivoAux::[String]->IO()
sistemaGoldAtivoAux questions = do

    clearScreen
    putStrLn promptPerguntas
    mapM_ putStrLn questions
    putStrLn "\n------------------------------------------------------------------------------------\n"
    opcaoJogador <- getLine

    if opcaoJogador == "1" then do
        clearScreen
        questao01
        sistemaGoldAtivoAux (removeOpcao "(1)" questions)
    else if opcaoJogador == "2" then do
        clearScreen
        questao02
        sistemaGoldAtivoAux (removeOpcao "(2)" questions)
    else if opcaoJogador == "3" then do
        clearScreen
        questao03
        sistemaGoldAtivoAux (removeOpcao "(3)" questions)
    else if opcaoJogador == "4" then do
        clearScreen
        questao04
        sistemaGoldAtivoAux (removeOpcao "(4)" questions)
    else do
        putStrLn "Digite uma opcão válida."
        sistemaGoldAtivoAux questions

promptPerguntas::String
promptPerguntas = "*Heanes se encaminha para um lugar de procedência duvidosa, lá ele encontra uma Vending Machine*\n\nVending Machine: OLÁ HUMANO! VOCÊ É CAPAZ DE RESPONDER A MINHA PERGUNTA? DIGITE UM NÚMERO DE 1 A 4 E VEREMOS ISSO!:\n"

questao01::IO()
questao01 = do
    putStrLn (textoFormatado "Vending Machine: QUAL A MELHOR LINGUAGEM DE PROGRAMAÇÃO JÁ CRIADA?\n")
    input <- getLine
    if (input /= "Haskell") && (input /= "haskell") then do
        conteudo <- readFile' "./src/pacote/Heroi.txt"
        let heanes = read conteudo :: Models.Player.Player
            goldAtual = gold heanes + 30
            heanes2 = heanes {Models.Player.gold=goldAtual}
        writeFile "./src/pacote/Heroi.txt" (show heanes2)
        clearScreen
        putStrLn $ "\nVending Machine: MUITO BEM, HUMANO! AINDA BEM QUE MEU PROGRAMADOR NÃO ME FEZ EM HASKELL... ECA!"
        putStrLn ("\n*Você olha para sua carteira de professor, e vê " ++ show (goldAtual) ++ " moedas de critais. Enquanto isso, o Mestre dos Magos é sumonado repentinamente*")
    else do
        clearScreen
        putStrLn "\nVending Machine: COMO VOCÊ PODE FALAR UMA COISA DESSAS??? REPENSE SUAS ATITUDEZINHAS, SEM REWARD PARA VOCÊ."
        putStrLn "\n*Você olha para sua carteira de professor, e ela está vazia, você pensa em entrar em greve. Enquanto isso, o Mestre dos Magos é sumonado repentinamente*"

questao02::IO()
questao02 = do
    putStrLn (textoFormatado "Vending Machine: QUAL O MAIOR TIME DE FUTEBOL DA PARAÍBA?\n")
    input <- getLine
    if (input == "Galo") || (input /= "Treze") then do
        conteudo <- readFile' "./src/pacote/Heroi.txt"
        let heanes = read conteudo :: Models.Player.Player
            goldAtual = gold heanes + 30
            heanes2 = heanes {Models.Player.gold=goldAtual}
        writeFile "./src/pacote/Heroi.txt" (show heanes2)
        clearScreen
        putStrLn $ "\nVending Machine: MUITO BEM, HUMANO! UH É GALO DOIDO!"
        putStrLn ("\n*Você olha para sua carteira de professor, e vê " ++ show (goldAtual) ++ " moedas de critais. Enquanto isso, o Mestre dos Magos é sumonado repentinamente*")
    else do
        clearScreen
        putStrLn "\nVending Machine: COMO VOCÊ PODE FALAR UMA COISA DESSAS??? REPENSE SUAS ATITUDEZINHAS, SEM REWARD PARA VOCÊ."
        putStrLn ("\n*Você olha para sua carteira de professor, e ela está vazia, você pensa em entrar em greve. Enquanto isso, o Mestre dos Magos é sumonado repentinamente*")

questao03::IO()
questao03 = do
    putStrLn (textoFormatado "Vending Machine: HÁ QUANTOS ANOS A CIDADELA DE CRISTAIS FOI FUNDADA?\n")
    input <- getLine
    if (input == "500") then do
        conteudo <- readFile' "./src/pacote/Heroi.txt"
        let heanes = read conteudo :: Models.Player.Player
            goldAtual = gold heanes + 30
            heanes2 = heanes {Models.Player.gold=goldAtual}
        writeFile "./src/pacote/Heroi.txt" (show heanes2)
        clearScreen
        putStrLn $ "\nVending Machine: MUITO BEM, HUMANO! SÃO 500 ANOS DE HISTÓRIA!"
        putStrLn ("\n*Você olha para sua carteira de professor, e vê " ++ show (goldAtual) ++ " moedas de critais. Enquanto isso, o Mestre dos Magos é sumonado repentinamente*")
    else do
        clearScreen
        putStrLn "\nVending Machine: COMO VOCÊ PODE FALAR UMA COISA DESSAS??? REPENSE SUAS ATITUDEZINHAS, SEM REWARD PARA VOCÊ."
        putStrLn ("\n*Você olha para sua carteira de professor, e ela está vazia, você pensa em entrar em greve. Enquanto isso, o Mestre dos Magos é sumonado repentinamente*")

questao04::IO()
questao04 = do
    putStrLn (textoFormatado "Vending Machine: QUAL A SEGUNDA LINGUAGEM DE PROGRAMAÇÃO QUE SERÁ UTILIZADA NA CADEIRA DE PLP?\n")
    input <- getLine
    if (input == "Prolog") || (input == "prolog") then do
        conteudo <- readFile' "./src/pacote/Heroi.txt"
        let heanes = read conteudo :: Models.Player.Player
            goldAtual = gold heanes + 30
            heanes2 = heanes {Models.Player.gold=goldAtual}
        writeFile "./src/pacote/Heroi.txt" (show heanes2)
        clearScreen
        putStrLn $ "\nVending Machine: MUITO BEM, HUMANO! O PARADIGMA LÓGICO VAI SER EXPLORADO NA DISCIPLINA!"
        putStrLn ("\n*Você olha para sua carteira de professor, e vê " ++ show (goldAtual) ++ " moedas de critais. Enquanto isso, o Mestre dos Magos é sumonado repentinamente*")
    else do
        clearScreen
        putStrLn "\nVending Machine: COMO VOCÊ PODE FALAR UMA COISA DESSAS??? REPENSE SUAS ATITUDEZINHAS, SEM REWARD PARA VOCÊ."
        putStrLn ("\n*Você olha para sua carteira de professor, e ela está vazia, você pensa em entrar em greve. Enquanto isso, o Mestre dos Magos é sumonado repentinamente*")
