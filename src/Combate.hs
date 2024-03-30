module Combate where
import Util.Lib
import Util.CombateFuncoes
import Historia
import Models.Player
import Models.Inimigo
import System.IO
import CombateKanva

explicacaoCombate01 :: String
explicacaoCombate01 = textoFormatado "Você estará entrando em combate em breve. Suas jogadas serão definidas em turnos intercalados entre você e seu inimigo, por isso, tome bastante cuidado nas suas decisões.\n"

combate01 :: IO()
combate01 = do
    putStrLn kanvaHistoria1
    esperandoEnter
    clearScreen
    putStrLn kanvaHistoria2
    esperandoEnter
    clearScreen
    putStrLn kanvaHistoria3
    esperandoEnter
    clearScreen
    putStrLn kanvaHistoria4
    esperandoEnter
    clearScreen
    putStrLn kanvaHistoria5
    esperandoEnter
    clearScreen
    putStrLn kanvaHistoria6
    esperandoEnter
    clearScreen
    putStrLn kanvaHistoria7
    esperandoEnter
    clearScreen
    putStrLn "A WILD CACHORRO CARAMELO APPEARS! Heanes e Leandro são cercados por cachorros caramelos gigantes disformes.\n"
    putStrLn caramelosKanva
    esperandoEnter
    clearScreen
    putStrLn explicacaoCombate01
    esperandoEnter
    clearScreen

    putStrLn "Dê uma olhada nos seus status e nos status de seu inimigo. Quando utilizar um item ou poção os atributos vão ser adicionados aos seus status básicos. Quando você utiliza um equipamento ou poção, ele é descartado após o combate, logo, tenha cuidado no que vai usar.\n"

    arquivoCaramelos <- readFile' "./src/pacote/Cachorros Caramelos.txt"
    let caramelos = read arquivoCaramelos :: Inimigo
    print caramelos

    heanes <- carregaPlayer
    print heanes

    putStrLn ( textoFormatado ("\nVocê terá 2 turnos, um de preparo e outro que vai ser seguido pelo ataque dos caramelos. Prepare-se antes que os caramelinhos te bazuquem na base da mordida!\n"))
    esperandoEnter
    clearScreen
    turnoPreparacao
    clearScreen
    turnoAcao01

turnoAcao01 :: IO()
turnoAcao01 = do
    turnoHeanesCaramelo
    turnoCaramelo
    heanes <- carregaPlayer
    inimigo <- carregaInimigo (criaCaminho "Cachorros Caramelos")
    if verificaMortoHeroi heanes || verificaMortoInimigo inimigo then do
        if verificaMortoHeroi heanes then morte
        else combateKanva
    else turnoAcao01

turnoHeanesCaramelo :: IO()
turnoHeanesCaramelo = do
    clearScreen
    heanes <- carregaPlayer
    if not (verificaMortoHeroi heanes) then do
        putStrLn(("Escolha uma ação:\n"))
        putStrLn(textoFormatado("(1) Ataque.\n(2) Usa poção.\n"))
        input <- getLine
    
        if trim input == "1" then do
            clearScreen
            usaAtaque
            putStrLn "Voce desfere um ataque fatal a alguns cachorros que o cercavam. O IBAMA agora sabe onde você mora.\n"
            inimigo <- carregaInimigo (criaCaminho "Cachorros Caramelos") 
            print inimigo
            putStrLn "\n------------------------------------------------------------------------------------\n"
            esperandoEnter
        else if trim input == "2" then do 
            clearScreen
            usaPocao
        else do
            putStrLn "\nDigite uma opção válida."
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
    clearScreen
    inimigo <- carregaInimigo (criaCaminho "Cachorros Caramelos")
    if not (verificaMortoInimigo inimigo) then do
        putStrLn "UM CARAMELINHO TE MORDE VIOLENTAMENTE E VOCÊ GRITA: TIRA DOG TIRAAAA AYELLLLLLLLL ME AJUDA\n"
        turnoAtaqueCaramelo
        heanes <- carregaPlayer
        print heanes
        putStrLn "\n------------------------------------------------------------------------------------\n"
        esperandoEnter
    else putStrLn "Leandro: Você conseguiu! Matou todos os cachorros mágicos, eu sabia que você era forte.\n"

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
