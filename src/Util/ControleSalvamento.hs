{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
module Util.ControleSalvamento(
    comecaJogo , help, carregaJogo
) where
import Util.Lib
import Models.Item
import Models.Player
import Models.Conquista
import Models.Pocao
import Control.Exception
import Historia.Fase1
import Historia.Prologo

comecaJogo::IO()
comecaJogo = do
    putStrLn "Inicializando dados"
    inicializaDados
    comecoHistoria




help::IO()
help = putStrLn menuAjuda
    where
        menuAjuda :: String
        menuAjuda = unlines
            [ "Olá amigo viajante! Estou aqui para esclarecer algumas dúvidas que talvez você possa ter:\n"
            , "Em primeiro plano, este jogo é um RPG textual que segue o estilo IDLE para ganhar recursos. Além disso, ele é munido de 3 fases."
            , "Se você criou um jogo e após entrar na sua conta novamente você optou por inicializar o game,"            , "você perderá todo seu progresso, ou seja, TOME BASTANTE CUIDADO."
            , "Além disso, se você optar por continuar o jogo, vai começar da cidadela. Ou seja, se por algum motivo você fechou o jogo em uma luta ou morreu, vai começar da mesma fase, mas SEM GOLD."
            , "Por fim o que separa uma parte da história de outra são traços na tela: ----, como o que vai aparecer após você apertar Enter.\n"
            , "Bom jogo, e seja bem vindo a Fábulas de Magia : Cidadela de Cristal (FMCC)!"
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
    heanes <- carregaPlayer
    let progresso = getProgresso heanes
    case progresso of
        0 -> do
            putStrLn "Você não tem nenhum jogo salvo, ou você ainda não começou um jogo ou apenas não chegou ao fim do prólogo\n irei começar um jogo agora boa sorte na aventura!"
            comecaJogo
        1 -> carregandoJogo progresso


carregandoJogo::Int -> IO()
carregandoJogo progresso = 
    case progresso of
        0 -> comecaJogo
        1 -> escolhaCaminhoCidade
        2 -> putStrLn "fase2"
        3 -> putStrLn "fase3"
        4 -> putStrLn "fase4"






