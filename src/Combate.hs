module Combate where
import Util.Lib
import Loja
import Historia
import Models.Player
import Models.Inimigo
import Models.Item
import Models.Pocao
import System.IO
import CombateKanva

explicacaoCombate01 :: String
explicacaoCombate01 = textoFormatado "Suas jogadas serão definidas em turnos intercalados entre você e seu inimigo, por isso, tome bastante cuidado nas suas decisões."

combate01 :: IO()
combate01 = do
    putStrLn kanvaHistoria
    putStrLn "Sem tempo para terminar de falar, Heanes e Leandro são cercados por cachorros caramelos gigantes disformes."
    putStrLn caramelosKanva
    putStrLn explicacaoCombate01

    arquivoCaramelos <- readFile' "./src/pacote/Cachorros Caramelos.txt"
    let caramelos = read arquivoCaramelos :: Inimigo
    print caramelos

    putStrLn "\nDê uma olhada nos seus status também, quando utilizar um item ou poção os atributos vão ser adicionados aos seus status básicos.\n"
    arquivoHeroi <- readFile' "./src/pacote/Heroi.txt"
    let heroi = read arquivoHeroi :: Player
    print heroi

    turnoPreparacao
    turnoAcao01

turnoAcao01 :: IO()
turnoAcao01 = do
    turnoHeanes
    turnoInimigo
    heanes <- carregaPlayer
    inimigo <- carregaInimigo (criaCaminho "Cachorros Caramelos")
    if verificaMortoHeroi heanes || verificaMortoInimigo inimigo then do
        if verificaMortoHeroi heanes then putStrLn "aqui o bicho vai voltar pro inicio"
        else combateKanva
    else turnoAcao01

carregaInimigoAux::String
carregaInimigoAux = "Cachorros Caramelos.txt"

verificaMortoHeroi :: Player -> Bool
verificaMortoHeroi heanes = Models.Player.vida heanes <= 0

verificaMortoInimigo :: Inimigo -> Bool
verificaMortoInimigo inimigo = Models.Inimigo.vida inimigo <= 0

turnoHeanes :: IO()
turnoHeanes = do
    heanes <- carregaPlayer
    if not (verificaMortoHeroi heanes) then do
        putStrLn "(1)Ataque.\n(2)Usa poção."
        input <- getLine

        if input == "1" then do
            usaAtaque
            putStrLn "Voce desfere um ataque fatal a alguns cachorros que o cercavam."
        else if input == "2" then usaPocao
        else do
            putStrLn "Digite uma opção válida."
            turnoHeanes
    else putStrLn "voce morreu dog. os cachorros tinham raiva."

usaAtaque :: IO()
usaAtaque = do
    heanes <- carregaPlayer
    inimigo <- carregaInimigo (criaCaminho "Cachorros Caramelos")
    let ataqueHeanes = Models.Player.ataque heanes
        defesaInimigo = Models.Inimigo.defesa inimigo
        vidaInimigo = Models.Inimigo.vida inimigo
        vidaAtualizadaInimigo = (defesaInimigo + vidaInimigo) - ataqueHeanes
        filepath = criaCaminho (Models.Inimigo.nome inimigo)
        inimigoAtualizado = inimigo {Models.Inimigo.vida = vidaAtualizadaInimigo}
    writeFile filepath (show inimigoAtualizado)


turnoInimigo :: IO()
turnoInimigo = do
    inimigo <- carregaInimigo (criaCaminho "Cachorros Caramelos")
    if not (verificaMortoInimigo inimigo) then do
        putStrLn "UM CACHORRO TE MORDE VIOLENTAMENTE E VOCE GRITA: TIRA DOG TIRAAAA AYELLLLLLLLL ME AJUDA"
        turnoAtaqueInimigo
        heanes <- carregaPlayer
        print heanes
    else putStrLn "Leandro: Você conseguiu, matou todos os cachorros mágicos, eu sabia que você era forte."

turnoAtaqueInimigo :: IO()
turnoAtaqueInimigo = do
    heanes <- carregaPlayer
    inimigo <- carregaInimigo (criaCaminho "Cachorros Caramelos")
    let ataqueInimigo = Models.Inimigo.ataque inimigo
        defesaHeanes = Models.Player.defesa heanes
        vidaHeanes = Models.Player.vida heanes
        vidaAtualizadaHeanes = (defesaHeanes + vidaHeanes) - ataqueInimigo
        heanesAtualizado = heanes {Models.Player.vida = vidaAtualizadaHeanes}
    writeFile "./src/pacote/Heroi.txt" (show heanesAtualizado)

turnoPreparacao :: IO()
turnoPreparacao = do
    putStrLn "Começou a primeira fase, você terá 2 turnos, um de preparo e outro que vai ser seguido pelo ataque dos caramelos."
    putStrLn "(1)Equipar um item\n(2)Utilizar uma poção\n(3)Lutar."
    input <- getLine

    case input of
        "1" -> do
            equipaItem
            turnoPreparacao
        "2" -> do
            usaPocao
            turnoPreparacao
        "3" -> return ()
        _ -> turnoPreparacao

equipaItem :: IO()
equipaItem = do
    heroi <- carregaPlayer
    let equipamentos = Models.Player.equipamentos heroi
    print equipamentos

    putStrLn "Digite o nome do item que deseja equipar, logo depois disso seus status serão atualizados e mostrados."
    input <- getLine
    let maybeItem = identificaItem input equipamentos
    case maybeItem of
        Just item -> do
            let ataqueAtualizado = Models.Item.ataque item + Models.Player.ataque heroi
                defesaAtualizada = Models.Item.defesa item + Models.Player.defesa heroi
                listaItensAtualizada = removeItem input (Models.Player.equipamentos heroi)
                heanesAtualizado = heroi {Models.Player.ataque = ataqueAtualizado, Models.Player.defesa = defesaAtualizada, Models.Player.equipamentos = listaItensAtualizada}
            writeFile "./src/pacote/Heroi.txt" (show heanesAtualizado)
            putStrLn "Item equipado com sucesso.\n"
            print heanesAtualizado
        Nothing -> do
            putStrLn "Creio que digitou errado, mas caso queria voltar ao turno digite: voltar."
            input01 <- getLine
            if input01 == "voltar" then turnoPreparacao
            else equipaItem

usaPocao :: IO()
usaPocao = do
    heroi <- carregaPlayer
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
            putStrLn "Pocao inválida, caso queira voltar ao turno ao invés de digitar a poção novamente, digite: voltar."
            input01 <- getLine
            if input01 == "voltar" then turnoPreparacao
            else usaPocao

