module Combate where
import Lib
import Loja
import Historia
import Models.Player
import Models.Caramelo
import Models.Kanva
import Models.Item
import Models.Pocao
import System.IO


explicacaoCombate01 :: String
explicacaoCombate01 = textoFormatado "Suas jogadas serão definidas em turnos intercalados entre você e seu inimigo, por isso, tome bastante cuidado nas suas decisões."

combate01 :: IO()
combate01 = do
    putStrLn kanvaHistoria
    putStrLn "Sem tempo para terminar de falar, Heanes e Leandro são cercados por cachorros caramelos gigantes disformes."
    putStrLn caramelosKanva
    putStrLn explicacaoCombate01

    arquivoCaramelos <- readFile' "./src/pacote/CarameloShadow.txt"
    let caramelos = read arquivoCaramelos :: Caramelo
    print caramelos

    putStrLn "\nDê uma olhada nos seus status também, quando utilizar um item ou poção os atributos vão ser adicionados aos seus status básicos.\n"
    arquivoHeroi <- readFile' "./src/pacote/Heroi.txt"
    let heroi = read arquivoHeroi :: Player
    print heroi

    turnoPreparacao heroi
    putStrLn "turnoAcao01"

turnoPreparacao :: Player -> IO()
turnoPreparacao heroi = do
    putStrLn "Começou a primeira fase, você terá 2 turnos, um de preparo e outro que vai ser seguido pelo ataque dos caramelos."
    putStrLn "(1)Equipar um item\n(2)Utilizar uma poção\n(3)Mike Tyson."
    input <- getLine

    if input == "1" then equipaItem heroi
    else if input == "2" then usaPocao heroi
    else putStrLn "Entendo. Cai no soco então dog wulf wulf."

equipaItem :: Player -> IO()
equipaItem heroi = do
    let equipamentos = Models.Player.equipamentos heroi
    print equipamentos

    putStrLn "Digite o nome do item que deseja equipar, logo depois disso seus status serão atualizados e mostrados."
    input <- getLine
    let maybeItem = identificaItem input equipamentos
    case maybeItem of
        Just item -> do
            let ataqueAtualizado = Models.Item.ataque item + Models.Player.ataque heroi
                defesaAtualizada = Models.Item.defesa item + Models.Player.defesa heroi
                heanesAtualizado = heroi {Models.Player.ataque = ataqueAtualizado, Models.Player.defesa = defesaAtualizada}
            writeFile "./src/pacote/Heroi.txt" (show heanesAtualizado)
            putStrLn "Item equipado com sucesso.\n"
            print heanesAtualizado
        Nothing -> do
            putStrLn "Creio que digitou errado, mas caso queria voltar ao turno digite: voltar."
            input01 <- getLine
            if input01 == "voltar" then turnoPreparacao heroi
            else equipaItem heroi

usaPocao :: Player -> IO()
usaPocao heroi = do
    let pocoes = Models.Player.pocoes heroi
    print pocoes

    putStrLn "Digite o nome da poção que deseja equipar, logo depois disso seus status serão atualizados e mostrados."
    input <- getLine
    let maybePocao = identificaPocao input pocoes
    case maybePocao of
        Just pocao -> do
            let ataqueAtualizado = Models.Pocao.ataque pocao + Models.Player.ataque heroi
                defesaAtualizada = Models.Pocao.defesa pocao + Models.Player.defesa heroi
                vidaAtualizada = Models.Pocao.vida pocao + Models.Player.vida heroi
                pocaoInicial = pegaPocao input (Models.Player.pocoes heroi)
                quantidadeAtualizada = Models.Pocao.quantidade pocaoInicial - 1
                pocaoFinal = pocaoInicial {Models.Pocao.quantidade = quantidadeAtualizada}

            if quantidadeAtualizada == 0 then do
                let listaPocoesAtualizada = removePocaoAntiga input (Models.Player.pocoes heroi)
                    heanesAtualizado = heroi {Models.Player.ataque = ataqueAtualizado, Models.Player.defesa = defesaAtualizada, Models.Player.vida = vidaAtualizada, Models.Player.pocoes = listaPocoesAtualizada}
                writeFile "./src/pacote/Heroi.txt" (show heanesAtualizado)
                print heanesAtualizado
            else do
                let listaPocoesAtualizada = removePocaoAntiga input (Models.Player.pocoes heroi) ++ [pocaoFinal]
                    heanesAtualizado = heroi {Models.Player.ataque = ataqueAtualizado, Models.Player.defesa = defesaAtualizada, Models.Player.vida = vidaAtualizada, Models.Player.pocoes = listaPocoesAtualizada}
                writeFile "./src/pacote/Heroi.txt" (show heanesAtualizado)
                print heanesAtualizado
            putStrLn "Pocao utilizada com sucesso."

        Nothing -> do
            putStrLn "Creio que digitou errado, mas caso queria voltar ao turno digite: voltar."
            input01 <- getLine
            if input01 == "voltar" then turnoPreparacao heroi
            else usaPocao heroi
