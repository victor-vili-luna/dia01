module Util.Lib where

import System.Process
import Models.Conquista
import Models.Item
import Models.Player
import Models.Pocao
import System.IO

textoFormatado::String->String
textoFormatado texto = texto ++ "\n------------------------------------------------------------------------------------\n"

removeOpcao::String->[String]->[String]
removeOpcao _ [] = []
removeOpcao opcao (a:as)
    | a == opcao = as
    | otherwise = a : removeOpcao opcao as

clearScreen::IO()
clearScreen = do
    _ <- system "clear"
    putStr "\ESC[H"

carregaPlayer :: IO Player
carregaPlayer = do
        handle <- openFile "./src/pacote/Heroi.txt" ReadMode
        conteudo <- hGetContents' handle
        hClose handle
        return (read conteudo :: Player)

salvaPlayer:: Player -> IO()
salvaPlayer heanes = writeFile "./src/pacote/Heroi.txt" (show heanes)

salvaItens:: [Item] -> IO()
salvaItens itens= do
    let listaItens = unlines (map show itens)
    writeFile "./src/pacote/ItensIniciais.txt" listaItens

salvaPocao:: [Pocao] -> IO()
salvaPocao pocoes =do
     let listaPocao= unlines (map show pocoes)
     writeFile "./src/pacote/PocaoInicial.txt" listaPocao

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
    _ <- getChar
    return ()

atualizaProgresso::Int -> IO()
atualizaProgresso novoProgresso = do
    heanes <- carregaPlayer
    let novoHeanes = attProgresso heanes novoProgresso
    salvaPlayer novoHeanes
