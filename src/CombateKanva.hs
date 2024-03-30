module CombateKanva where

import Historia
import Util.Lib
import Models.Player
import Models.Pocao
import System.IO
import Util.CombateFuncoes
import Models.Inimigo
import Historia.Fase2 (escolhaCaminhoCidadeFase2)


combateKanva :: IO()
combateKanva = do
    putStrLn "Sem tempo para comemorar a vitória você é puxado para dentro do museu deixando Leandro para trás."
    putStrLn vilaoKanva
    putStrLn "Voce consegue se soltar enquanto ele divaga e dístraido, você tem chance de se preparar para o combate."
    putStrLn "Esses são seus status atuais, mas C.W. te acompanha de longe e liberou uma poção a mais no seu inventário, veja o que quer fazer tendo em vista que essa poção não pode ser comprada, se utilizar todos os exemplares ela sumirá para sempre."

    adicionaPocaoCW
    heanes <- carregaPlayer
    print heanes

    putStrLn "Kanva finalmente notou que você se aproxima para o combate!!\nTOME SUA DECISÃO HÉROI!!"
    turnoAcaoKanva

adicionaPocaoCW :: IO()
adicionaPocaoCW = do
    heroi <- carregaPlayer
    arquivoPocao <- readFile' "./src/pacote/PocaoMonster.txt"
    let pocaoMonster = read arquivoPocao :: Pocao
        pocoesAtualizada = Models.Player.pocoes heroi ++ [pocaoMonster]
        heanesAtualizado = heroi {Models.Player.pocoes = pocoesAtualizada}
    writeFile "./src/pacote/Heroi.txt" (show heanesAtualizado)
turnoAcaoKanva :: IO()
turnoAcaoKanva = do
    turnoHeanesKanva
    turnoKanva
    heanes <- carregaPlayer
    inimigo <- carregaInimigo (criaCaminho "Kanva")
    if verificaMortoHeroi heanes || verificaMortoInimigo inimigo then do
        if verificaMortoHeroi heanes then putStrLn "aqui o bicho vai voltar pro inicio"
        else do
            putStrLn vitoriaKanva
            escolhaCaminhoCidadeFase2
    else turnoAcaoKanva

turnoHeanesKanva :: IO()
turnoHeanesKanva = do
    heanes <- carregaPlayer
    if not (verificaMortoHeroi heanes) then do
        putStrLn "(1)Ataque.\n(2)Usa poção."
        input <- trim <$> getLine
        if input == "1" then do
            usaAtaqueKanva
            putStrLn "Você faz a I.A. aposentar os pincéis."
        else if input == "2" then usaPocao
        else do
            putStrLn "Digite uma opção válida."
            turnoHeanesKanva
    else putStrLn "Voce errou"

usaAtaqueKanva :: IO ()
usaAtaqueKanva = do
    heanes <- carregaPlayer
    inimigo <- carregaInimigo (criaCaminho "Kanva")
    let ataqueHeanes = Models.Player.ataque heanes
        defesaInimigo = Models.Inimigo.defesa inimigo
        vidaInimigo = Models.Inimigo.vida inimigo
        vidaAtualizadaInimigo = (defesaInimigo + vidaInimigo) - ataqueHeanes
        filepath = criaCaminho (Models.Inimigo.nome inimigo)
        inimigoAtualizado = inimigo {Models.Inimigo.vida = vidaAtualizadaInimigo}
    writeFile filepath (show inimigoAtualizado)

turnoKanva :: IO()
turnoKanva = do
    inimigo <- carregaInimigo (criaCaminho "Kanva")
    if not (verificaMortoInimigo inimigo) then do
        if Models.Inimigo.vida inimigo > 35 then do
            ataqueEscolhido <- escolheAtaqueKanva ["Kanva desenha uma bola de fogo indo na sua direcao", "Repentinamente varias telas saltam sobre voce!! CUIDADO!", "Mais algum ataque do giga"]
            print ataqueEscolhido
            turnoAtaqueKanva
        else do
            putStrLn "Kanvas se enfurece cada vez mais e utiliza sua habilidade especial!! O dano dele é aumentado!\n Não sei qual vai ser, mudem aqui."
            turnoVidaBaixaKanva
        heanes <- carregaPlayer
        print heanes
    else putStrLn "O Kanva foi derrotado, PARABÉNS HERÓI!!!! A CIDADE COMEMORA POR VOCÊ."

turnoAtaqueKanva :: IO()
turnoAtaqueKanva = do
    heanes <- carregaPlayer
    inimigo <- carregaInimigo (criaCaminho "Kanva")
    let ataqueInimigo = Models.Inimigo.ataque inimigo
        defesaHeanes = Models.Player.defesa heanes
        vidaHeanes = Models.Player.vida heanes
        vidaAtualizadaHeanes = (defesaHeanes + vidaHeanes) - ataqueInimigo
        heanesAtualizado = heanes {Models.Player.vida = vidaAtualizadaHeanes}
    writeFile "./src/pacote/Heroi.txt" (show heanesAtualizado)

escolheAtaqueKanva :: [String] -> IO String
escolheAtaqueKanva lista = do
    inimigo <- carregaInimigo (criaCaminho "Kanva")
    let index = Models.Inimigo.vida inimigo `mod` 4
    return (lista !! index)

turnoVidaBaixaKanva :: IO()
turnoVidaBaixaKanva = do
    heanes <- carregaPlayer
    inimigo <- carregaInimigo (criaCaminho "Kanva")
    let ataqueInimigo = Models.Inimigo.habilidadeEspecial inimigo
        defesaHeanes = Models.Player.defesa heanes
        vidaHeanes = Models.Player.vida heanes
        vidaAtualizadaHeanes = (defesaHeanes + vidaHeanes) - ataqueInimigo
        heanesAtualizado = heanes {Models.Player.vida = vidaAtualizadaHeanes}
    writeFile "./src/pacote/Heroi.txt" (show heanesAtualizado)
