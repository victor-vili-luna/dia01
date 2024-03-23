module SistemaGold where

import System.IO (hReady, stdin)
import Control.Concurrent(threadDelay)
import Historia

sistemaGoldPassivoAux::IO()
sistemaGoldPassivoAux = do
    putStrLn "carregando caixas..."
    input <- hReady stdin
    if input then do
        putStrLn "Você se cansa rápido para um Héroi...Aqui está seu dinheiro: " ++ getGold
    else do 
        let goldAtual = getGold + 1
        threadDelay(5*1000000)
        sistemaGoldPassivoAux

sistemaGoldAtivoAux::IO()
sistemaGoldAtivoAux = do

    clearScreen

    putStrLn questao01
    input <- getLine
    if input == "animals" then do
        putStrLn "Muito bem. Aqui está sua recompensa" --setGold 30
        putStrLn "A proxima questão só sera liberada quando enfrentar a fase."
    else do
        putStrLn "Resposta errada professor..."

questao01::String
questao01 = textoFormatado "AAUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU, de qual música é esse uivado?"

questao02::String
questao02 = textoFormatado "q02"

questao03::String
questao03 = textoFormatado "q03"

questao04::String
questao04 = textoFormatado "q03"

atualizaGold::Int->IO()
atualizaGold quantia = do
    heroiAntigo <- readFile' "dia01/src/pacote/Heroi.txt"
    let heanes = read heroiAntigo :: Models.Player.Player
        heanes2 = heanes {Models.Player.gold=quantia}
    writeFile "dia01/src/pacote/Heroi.txt" (show heanes2)