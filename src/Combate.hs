module Combate where
import Util.Lib
import Util.CombateFuncoes
import Historia
import Models.Player
import Models.Inimigo
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
    putStrLn "Dica: Quando você utiliza um equipamento ou poção, ele é descartado após o combate, logo, tenha cuidado no que vai usar."
    heanes <- carregaPlayer
    print heanes

    putStrLn "Começou a primeira fase, você terá 2 turnos, um de preparo e outro que vai ser seguido pelo ataque dos caramelos."
    turnoPreparacao
    turnoAcao01

turnoAcao01 :: IO()
turnoAcao01 = do
    turnoHeanesCaramelo
    turnoCaramelo
    heanes <- carregaPlayer
    inimigo <- carregaInimigo (criaCaminho "Cachorros Caramelos")
    if verificaMortoHeroi heanes || verificaMortoInimigo inimigo then do
        if verificaMortoHeroi heanes then putStrLn "aqui o bicho vai voltar pro inicio"
        else combateKanva
    else turnoAcao01

turnoHeanesCaramelo :: IO()
turnoHeanesCaramelo = do
    heanes <- carregaPlayer
    if not (verificaMortoHeroi heanes) then do
        putStrLn "(1)Ataque.\n(2)Usa poção."
        input <- getLine
    
        if trim input == "1" then do
            usaAtaque
            putStrLn "Voce desfere um ataque fatal a alguns cachorros que o cercavam."
        else if trim input == "2" then usaPocao
        else do
            putStrLn "Digite uma opção válida."
            turnoHeanesCaramelo
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


turnoCaramelo :: IO()
turnoCaramelo = do
    inimigo <- carregaInimigo (criaCaminho "Cachorros Caramelos")
    if not (verificaMortoInimigo inimigo) then do
        putStrLn "UM CACHORRO TE MORDE VIOLENTAMENTE E VOCE GRITA: TIRA DOG TIRAAAA AYELLLLLLLLL ME AJUDA"
        turnoAtaqueCaramelo
        heanes <- carregaPlayer
        print heanes
    else putStrLn "Leandro: Você conseguiu, matou todos os cachorros mágicos, eu sabia que você era forte."

turnoAtaqueCaramelo :: IO()
turnoAtaqueCaramelo = do
    heanes <- carregaPlayer
    inimigo <- carregaInimigo (criaCaminho "Cachorros Caramelos")
    let ataqueInimigo = Models.Inimigo.ataque inimigo
        defesaHeanes = Models.Player.defesa heanes
        vidaHeanes = Models.Player.vida heanes
        vidaAtualizadaHeanes = (defesaHeanes + vidaHeanes) - ataqueInimigo
        heanesAtualizado = heanes {Models.Player.vida = vidaAtualizadaHeanes}
    writeFile "./src/pacote/Heroi.txt" (show heanesAtualizado)

