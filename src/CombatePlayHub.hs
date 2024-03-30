module CombatePlayHub where

import Models.Inimigo
import Models.Item
import Models.Player
import Util.Lib
import Util.CombateFuncoes
import Historia
import Historia.Fase3

combatePlayHub :: IO()
combatePlayHub = do
    putStrLn vilaoPlayHub

    heanes <- carregaPlayer
    print heanes

    putStrLn "A fusão das IAs te amedronta, elas começam a te inebriar."
    turnoAcaoPlayHub

turnoAcaoPlayHub :: IO()
turnoAcaoPlayHub = do
    turnoHeanesPlayHub
    turnoPlayHub
    heanes <- carregaPlayer
    inimigo <- carregaInimigo (criaCaminho "PlayHub")
    if verificaMortoHeroi heanes || verificaMortoInimigo inimigo then do
        if verificaMortoHeroi heanes then morte
        else vitoriaPlayHub
    else turnoAcaoPlayHub

turnoHeanesPlayHub :: IO()
turnoHeanesPlayHub = do
    heanes <- carregaPlayer
    if not (verificaMortoHeroi heanes) then do
        putStrLn "(1)Ataque.\n(2)Usa poção."
        input <- getLine

        if trim input == "1" then do
            usaAtaquePlayHub
            putStrLn ""
        else if trim input == "2" then usaPocao
        else do
            putStrLn "Digite uma opção válida."
            turnoHeanesPlayHub
    else putStrLn "Voce errou"

usaAtaquePlayHub :: IO ()
usaAtaquePlayHub = do
    heanes <- carregaPlayer
    inimigo <- carregaInimigo (criaCaminho "PlayHub")
    let ataqueHeanes = Models.Player.ataque heanes
        defesaInimigo = Models.Inimigo.defesa inimigo
        vidaInimigo = Models.Inimigo.vida inimigo
        vidaAtualizadaInimigo = (defesaInimigo + vidaInimigo) - ataqueHeanes
        filepath = criaCaminho (Models.Inimigo.nome inimigo)
        inimigoAtualizado = inimigo {Models.Inimigo.vida = vidaAtualizadaInimigo}
    writeFile filepath (show inimigoAtualizado)

turnoPlayHub :: IO()
turnoPlayHub = do
    inimigo <- carregaInimigo (criaCaminho "PlayHub")
    if not (verificaMortoInimigo inimigo) then do
        if Models.Inimigo.vida inimigo > 35 then do
            ataqueEscolhido <- escolheAtaquePlayHub ["*Voce escuta uma voz...*Heanes: C.W.?\nDistraido, Heanes e atacado furiosamente.", "Voce foi transformado em um PDF e perdeu 3kbs, cuidadoo!", "A fusão das IAs te afunda no chão!!"]
            print ataqueEscolhido
            turnoAtaquePlayHub
        else do
            putStrLn "PlayHub para de brincadeira e utiliza uma mixagem de todas as vozes que pegou para gritar e um som ensurdecedor afeta Heanes criticamente!!!"
            turnoVidaBaixaPlayHub
        heanes <- carregaPlayer
        print heanes
    else putStrLn "OH-Ho, você conseguiu héroi!!"

turnoAtaquePlayHub :: IO()
turnoAtaquePlayHub = do
    heanes <- carregaPlayer
    inimigo <- carregaInimigo (criaCaminho "PlayHub")
    let ataqueInimigo = Models.Inimigo.ataque inimigo
        defesaHeanes = Models.Player.defesa heanes
        vidaHeanes = Models.Player.vida heanes
        vidaAtualizadaHeanes = (defesaHeanes + vidaHeanes) - ataqueInimigo
        heanesAtualizado = heanes {Models.Player.vida = vidaAtualizadaHeanes}
    writeFile "./src/pacote/Heroi.txt" (show heanesAtualizado)

escolheAtaquePlayHub :: [String] -> IO String
escolheAtaquePlayHub lista = do
    inimigo <- carregaInimigo (criaCaminho "PlayHub")
    let index = Models.Inimigo.vida inimigo `mod` 3
    return (lista !! index)

turnoVidaBaixaPlayHub :: IO()
turnoVidaBaixaPlayHub = do
    heanes <- carregaPlayer
    inimigo <- carregaInimigo (criaCaminho "PlayHub")
    let ataqueInimigo = Models.Inimigo.habilidadeEspecial inimigo
        defesaHeanes = Models.Player.defesa heanes
        vidaHeanes = Models.Player.vida heanes
        vidaAtualizadaHeanes = (defesaHeanes + vidaHeanes) - ataqueInimigo
        heanesAtualizado = heanes {Models.Player.vida = vidaAtualizadaHeanes}
    writeFile "./src/pacote/Heroi.txt" (show heanesAtualizado)


vitoriaPlayHub::IO()
vitoriaPlayHub = do
    putStrLn "vitoriaKanvaDialogo"
    comecaFase3
    escolhaCaminhoCidadeFase3