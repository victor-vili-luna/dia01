{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
module Util.ControleSalvamento(comecaJogo , help, carregaJogo) where
import Util.Lib
import Models.Item
import Models.Player
import Models.Conquista
import Models.Pocao
import Control.Exception


comecaJogo::IO()
comecaJogo = do
    putStrLn "Inicializando dados"
    inicializaDados




help::IO()
help = putStrLn menuAjuda
    where
        menuAjuda :: String
        menuAjuda = unlines
            [ "Olá amigo viajante! Estou aqui para esclarecer algumas dúvidas que talvez você possa ter:"
            , "Em primeiro plano, este jogo é um RPG textual que segue o estilo IDLE para ganhar recursos. Além disso, ele é munido de 3 fases."
            , "Agora vamos falar um pouco sobre o salvamento e a parte das conquistas. Se você criou um jogo e após entrar na sua conta novamente você optou por inicializar o game,"            , "vai acontecer que você vai perder todo seu progresso, INCLUSIVE as conquistas, ou seja, tome cuidado."
            , "Além disso, se você optar por continuar o jogo, vai começar da cidadela, ou seja, se por algum motivo você fechou o jogo em uma luta ou morreu, vai começar da mesma fase, mas SEM GOLD."
            , "Por fim o que separa uma parte da história de outra é um trasejado de ---- como o que vai aparecer após você apertar Enter"
            , "Bom jogo!"
            ]


inicializaDados::IO()
inicializaDados = do
    let heanes = player
        itens = [item espada , item armadura]
        pocaoItem = [pocao]
    conquista <- listaDeConquista
    salvaPlayer heanes
    salvaItens itens
    salvaPocao pocaoItem
    salvaConquista conquista

heanesString :: String
heanesString = "Player {nome = \"Heanes\", vida = 100, gold = 0, defesa = 5, ataque = 5, equipamentos = [], pocoes = [], progresso = 0}"

armadura :: String
armadura =  "Item {nome = \"Armadura de couro\", preco = 30, ataque = 0, defesa = 30, descricao = \"Armadura que protege contra as falacias da IA.\"}"

espada::  String
espada = "Item {nome = \"Espada de ferro\", preco = 30, ataque = 30, defesa = 0, descricao = \"Se quiser espada tem, mas so usa espada quem nao se garante.\"}"

cafe:: String
cafe = "Pocao {nome = \"Cafe\", vida = 40, preco = 20, defesa = 0, ataque = 0, quantidade = 0}"

item::String -> Item
item = read

player ::Player
player = read heanesString

pocao :: Pocao
pocao = read cafe

conquistas::String
conquistas = "Conquista {nomeC = \"Jubilado\", descricao = \"Negue Carl Wilson 8 vezes\", alcancou = False}\nConquista {nomeC = \"Se voce nao parar eu Paro\", descricao = \"Tome 6 Pocoes\", alcancou = False}\nConquista {nomeC = \"Faixa Preta\", descricao = \"Derrotou ConversaGPT\", alcancou = False}"

listaDeConquista:: IO [Conquista]
listaDeConquista = return (map parseConquista (lines conquistas))


carregaJogo::IO()
carregaJogo = do
    result <- try carregaPlayer :: IO (Either SomeException Player)
    case result of
        Left _ -> do
            putStrLn "Você não tem nenhum jogo salvo, irei começar um jogo agora boa sorte na aventura!"
            comecaJogo
        Right heanes -> carregandoJogo (getProgresso heanes)


carregandoJogo::Int -> IO()
carregandoJogo progresso = 
    case progresso of
        0 -> comecaJogo
        1 -> putStrLn "fase1"
        2 -> putStrLn "fase2"
        3 -> putStrLn "fase3"
        4 -> putStrLn "fase4"






