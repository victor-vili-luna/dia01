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

        heroiAntigo <- readFile' "./src/pacote/Heroi.txt"
        let heanes = read heroiAntigo :: Player
            goldAtual = goldAntigo + 3
            heanes2 = heanes {Models.Player.gold=goldAtual}
        writeFile "./src/pacote/Heroi.txt" (show heanes2)
        putStrLn "Você se cansa rápido para um héroi... Aqui está sua quantia atual de gold: "
        print goldAtual

    else do 
        threadDelay(3*1000000)
        sistemaGoldPassivoAux (goldAntigo+3)

sistemaGoldAtivoAux::IO()
sistemaGoldAtivoAux = do

    clearScreen

    putStrLn questao01
    input <- getLine
    if input == "animals" then do
        conteudo <- readFile' "./src/pacote/Heroi.txt"
        let heanes = read conteudo :: Models.Player.Player
            goldAtual = gold heanes + 30
            heanes2 = heanes {Models.Player.gold=goldAtual}
        writeFile "./src/pacote/Heroi.txt" (show heanes2)
        putStrLn $ "Muito bem. Aqui está sua recompensa: " ++ show (gold heanes2)
        putStrLn "A proxima questão só sera liberada quando enfrentar a fase."
    else do
        putStrLn "Resposta errada professor, logo voce nao ganhou nada."

questao01::String
questao01 = textoFormatado "AAUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU, de qual música é esse uivo?"

questao02::String
questao02 = textoFormatado "q02"

questao03::String
questao03 = textoFormatado "q03"

questao04::String
questao04 = textoFormatado "q04"
