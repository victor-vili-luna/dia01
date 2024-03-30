module CombateGPT where

import Historia
import Util.Lib
import Models.Player
import Models.Pocao
import System.IO
import Util.CombateFuncoes
import Models.Inimigo


combateGPT01 :: IO()
combateGPT01 = do
    putStrLn vilaoGPT

    heanes <- carregaPlayer
    print heanes

    putStrLn "ConversaGPT te ataca vigorosamente, está será sua última batalha, USE TUDO."
    turnoAcaoGPT

turnoAcaoGPT :: IO()
turnoAcaoGPT = do
    turnoHeanesGPT
    turnoGPT
    heanes <- carregaPlayer
    inimigo <- carregaInimigo (criaCaminho "ConversaGPT")
    if verificaMortoHeroi heanes || verificaMortoInimigo inimigo then do
        if verificaMortoHeroi heanes then putStrLn "aqui o bicho foi de vala."
        else do
            putStrLn vitoriaGPT
            putStrLn endGame
    else turnoAcaoGPT

turnoHeanesGPT :: IO()
turnoHeanesGPT = do
    heanes <- carregaPlayer
    if not (verificaMortoHeroi heanes) then do
        putStrLn "(1)Ataque.\n(2)Usa poção."
        input <- trim <$>getLine

        if input == "1" then do
            usaAtaqueGPT
            putStrLn "Você faz a I.A. correr com o rabo entre as pernas, mas você é impiedoso e o mata pelas costas jogando o teorema do resto chinês nele."
        else if input == "2" then usaPocao
        else do
            putStrLn "Digite uma opção válida."
            turnoHeanesGPT
    else putStrLn "Voce errou"

usaAtaqueGPT :: IO ()
usaAtaqueGPT = do
    heanes <- carregaPlayer
    inimigo <- carregaInimigo (criaCaminho "ConversaGPT")
    let ataqueHeanes = Models.Player.ataque heanes
        defesaInimigo = Models.Inimigo.defesa inimigo
        vidaInimigo = Models.Inimigo.vida inimigo
        vidaAtualizadaInimigo = (defesaInimigo + vidaInimigo) - ataqueHeanes
        filepath = criaCaminho (Models.Inimigo.nome inimigo)
        inimigoAtualizado = inimigo {Models.Inimigo.vida = vidaAtualizadaInimigo}
    writeFile filepath (show inimigoAtualizado)

turnoGPT :: IO()
turnoGPT = do
    inimigo <- carregaInimigo (criaCaminho "ConversaGPT")
    if not (verificaMortoInimigo inimigo) then do
        if Models.Inimigo.vida inimigo > 35 then do
            ataqueEscolhido <- escolheAtaqueGPT ["ataque padrao 1", "ataque padrao 2", "ataque padrao 3"]
            print ataqueEscolhido
            turnoAtaqueGPT
        else do
            putStrLn "GPT utiliza sua habilidade especial, repetir a mesma coisa!! O dano dele é aumentado!\n Não sei qual vai ser, mudem aqui."
            turnoVidaBaixaGPT
        heanes <- carregaPlayer
        print heanes
    else putStrLn "O GPT foi derrotado, PARABÉNS HERÓI!!!! A CIDADE COMEMORA POR VOCÊ."

turnoAtaqueGPT :: IO()
turnoAtaqueGPT = do
    heanes <- carregaPlayer
    inimigo <- carregaInimigo (criaCaminho "ConversaGPT")
    let ataqueInimigo = Models.Inimigo.ataque inimigo
        defesaHeanes = Models.Player.defesa heanes
        vidaHeanes = Models.Player.vida heanes
        vidaAtualizadaHeanes = (defesaHeanes + vidaHeanes) - ataqueInimigo
        heanesAtualizado = heanes {Models.Player.vida = vidaAtualizadaHeanes}
    writeFile "./src/pacote/Heroi.txt" (show heanesAtualizado)

escolheAtaqueGPT :: [String] -> IO String
escolheAtaqueGPT lista = do
    inimigo <- carregaInimigo (criaCaminho "ConversaGPT")
    let index = Models.Inimigo.vida inimigo `mod` 4
    return (lista !! index)

turnoVidaBaixaGPT :: IO()
turnoVidaBaixaGPT = do
    heanes <- carregaPlayer
    inimigo <- carregaInimigo (criaCaminho "ConversaGPT")
    let ataqueInimigo = Models.Inimigo.habilidadeEspecial inimigo
        defesaHeanes = Models.Player.defesa heanes
        vidaHeanes = Models.Player.vida heanes
        vidaAtualizadaHeanes = (defesaHeanes + vidaHeanes) - ataqueInimigo
        heanesAtualizado = heanes {Models.Player.vida = vidaAtualizadaHeanes}
    writeFile "./src/pacote/Heroi.txt" (show heanesAtualizado)