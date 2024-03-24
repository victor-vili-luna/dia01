module Lib where

import System.Process
import Models.Conquista
import Models.Player
import System.IO

textoFormatado::String->String
textoFormatado texto = texto ++ "\n-----------------------------------------------------------------------------------------------------------------------------------------------------------------------\n"

clearScreen::IO()
clearScreen = do
    _ <- system "clear"
    putStr "\ESC[H"

carregaPlayer :: IO Player
carregaPlayer = do
        handle <- openFile "./pacote/Heroi.txt" ReadMode
        conteudo <- hGetContents' handle
        hClose handle
        return (read conteudo :: Player)

salvaConquista :: [Conquista] -> IO ()
salvaConquista conquistas = writeFile "./src/pacote/Conquista.txt" $ unlines (map show conquistas)

desbloqueaConquista :: String -> IO()
desbloqueaConquista nomeConquista = do
    conquistas <- carregaConquista  
    let conquistaDesbloqueda = desbloquearConquista nomeConquista conquistas
    salvaConquista conquistaDesbloqueda

carregaConquista :: IO [Conquista]
carregaConquista = do
        handle <- openFile "./src/pacote/Conquista.txt" ReadMode
        conteudo <- hGetContents' handle
        hClose handle
        return (map parseConquista (lines conteudo))


desbloquearConquista :: String -> [Conquista] -> [Conquista]
desbloquearConquista nomeConquista =
     map (\c -> if nomeC c == nomeConquista then c { alcancou = True } else c)

parseConquista :: String -> Conquista
parseConquista texto = read texto :: Conquista

fechaJogo :: String
fechaJogo = "Você fugiu covardemente...Boa sorte em ensinar o Teorema do resto chinês."

esperandoEnter :: IO ()
esperandoEnter = do
    putStr "Pressione Enter para continuar..."
    hFlush stdout
    _ <- getLine
    return ()
