module Util.Lib where

import System.Process
import Models.Conquista
import Models.Item
import Models.Player
import Models.Pocao
import System.IO
import Models.Inimigo
import Data.Char

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

carregaInimigo :: String -> IO Inimigo
carregaInimigo filepath = do
        handle <- openFile filepath ReadMode
        conteudo <- hGetContents' handle
        hClose handle
        return (read conteudo :: Inimigo)

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
    putStr "Pressione Enter para continuar...\n"
    hFlush stdout
    _ <- getChar
    return ()

criaCaminho :: String -> String
criaCaminho nomeInimigo = "./src/pacote/" ++ nomeInimigo ++".txt"

atualizaProgresso::Int -> IO()
atualizaProgresso novoProgresso = do
    heanes <- carregaPlayer
    let novoHeanes = attProgresso heanes novoProgresso
    salvaPlayer novoHeanes

comparaStrings :: String -> String -> Bool
comparaStrings str1 str2 = clean str1 == clean str2
    where clean = map toLower . trim

{-esse droWhile ficando fazendo o drop da lista enquanto o boll que passamos é verdadeiro só que nesse caso
o bool que passamos lambda que se o primeiro caracter for espaço vazio ou um tab ele vai dar drop -}
apagaEspacos :: String -> String
apagaEspacos = dropWhile (\c -> c == ' ' || c == '\t')

{-esse metodo recebe uma string e usa composição de função pra resolver ela, tipo em matematica quando faz
f(x) g(x)  e g(f(x)) so que no caso a composição é (reverse (apagaEspacos (reverse (palavra))))-}
apagaEspacosFim :: String -> String
apagaEspacosFim = reverse . apagaEspacos . reverse

trim :: String -> String
trim = apagaEspacos . apagaEspacosFim

identificaItem::String->[Item]->Maybe Item
identificaItem _ [] = Nothing
identificaItem nomeItem (item:itemSequente)
    | Models.Item.nome item == nomeItem = Just item
    | otherwise = identificaItem nomeItem itemSequente
    
pegaItem::String->[Item]->Item
pegaItem _ [] = error "Item errado" --nunca chega nesse codigo
pegaItem nomeItem (a:as)
    | Models.Item.nome a == nomeItem = a
    | otherwise = pegaItem nomeItem as
    
removeItem::String->[Item]->[Item]
removeItem _ [] = []
removeItem nomeItem (a:as)
    | Models.Item.nome a == nomeItem = as
    | otherwise = a : removeItem nomeItem as
    
identificaPocao::String->[Pocao]->Maybe Pocao
identificaPocao _ [] = Nothing
identificaPocao nomePocao (pocao:pocaoSequente)
    | Models.Pocao.nome pocao == nomePocao = Just pocao
    | otherwise = identificaPocao nomePocao pocaoSequente
    
identificaPocaoJaComprada::String->[Pocao]->Bool
identificaPocaoJaComprada _ [] = False
identificaPocaoJaComprada nomePocao (a:as)
    | Models.Pocao.nome a == nomePocao = True
    | otherwise = identificaPocaoJaComprada nomePocao as
    
pegaPocao::String->[Pocao]->Pocao
pegaPocao _ [] = error "Poção errada" --nunca chega nesse codigo
pegaPocao nomePocao (a:as)
    | Models.Pocao.nome a == nomePocao = a
    | otherwise = pegaPocao nomePocao as
    
removePocaoAntiga::String->[Pocao]->[Pocao]
removePocaoAntiga _ [] = []
removePocaoAntiga nomePocao (a:as)
    | Models.Pocao.nome a == nomePocao = as
    | otherwise = a : removePocaoAntiga nomePocao as

resetPlayer:: IO Player
resetPlayer = do
    heanes <- carregaPlayer
    let heanesReset = reset heanes
    salvaPlayer heanesReset
    return heanesReset

salvaInimigo:: Inimigo -> FilePath -> IO()
salvaInimigo inimigo caminho = writeFile caminho (show inimigo)

