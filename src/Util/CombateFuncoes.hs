module Util.CombateFuncoes where

import Models.Player
import Models.Item
import Models.Pocao
import Util.Lib
import Models.Inimigo

turnoPreparacao :: IO()
turnoPreparacao = do
    clearScreen
    putStrLn "O QUE TU VAI FAZER MEU DOG?\n"
    putStrLn (textoFormatado ("(1) Equipar um item\n(2) Utilizar uma poção\n(3) Lutar.\n"))
    input <- getLine

    case input of
        "1" -> do
            clearScreen
            equipaItem
            turnoPreparacao
        "2" -> do
            clearScreen
            usaPocao
            turnoPreparacao
        "3" -> return ()
        _ -> turnoPreparacao

equipaItem :: IO()
equipaItem = do
    heroi <- carregaPlayer
    let equipamentos = Models.Player.equipamentos heroi
    putStrLn "Esses são os seus equipamentos:\n"
    print equipamentos
        
    putStrLn (textoFormatado ("\nDigite o nome do item que deseja equipar, logo depois disso seus status serão atualizados e exibidos. Caso você não tenha nenhum item comprado, não espere ser capaz de equipar um item.\n"))
    input <- getLine
    let maybeItem = identificaItem input equipamentos
    case maybeItem of
        Just item -> do
            let ataqueAtualizado = Models.Item.ataque item + Models.Player.ataque heroi
                defesaAtualizada = Models.Item.defesa item + Models.Player.defesa heroi
                listaItensAtualizada = removeItem input (Models.Player.equipamentos heroi)
                heanesAtualizado = heroi {Models.Player.ataque = ataqueAtualizado, Models.Player.defesa = defesaAtualizada, Models.Player.equipamentos = listaItensAtualizada}
            writeFile "./src/pacote/Heroi.txt" (show heanesAtualizado)
            clearScreen
            putStrLn "Item equipado com sucesso.\n"
            print heanesAtualizado
            putStr (textoFormatado(""))
            esperandoEnter
        Nothing -> do
            clearScreen
            putStrLn (textoFormatado("Creio que digitou errado, mas caso queria voltar ao turno digite: VOLTAR.\n"))
            input01 <- getLine
            if input01 == "VOLTAR" then turnoPreparacao
            else equipaItem
        
usaPocao :: IO()
usaPocao = do
    heroi <- carregaPlayer
    let pocoes = Models.Player.pocoes heroi
    putStrLn "Essas são as suas poções:\n"
    print pocoes
        
    putStrLn (textoFormatado("\nDigite o nome da poção que deseja usar, logo depois disso seus status serão atualizados e exibidos. Caso você não tenha nenhuma poção comprada, não espere ser capaz de usar uma.\n"))
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
            clearScreen
            putStrLn (textoFormatado("Pocao inválida, caso queira voltar ao turno ao digite: VOLTAR.\n"))
            input01 <- getLine
            if input01 == "VOLTAR" then turnoPreparacao
            else usaPocao
        
verificaMortoHeroi :: Player -> Bool
verificaMortoHeroi heanes = Models.Player.vida heanes <= 0
            
verificaMortoInimigo :: Inimigo -> Bool
verificaMortoInimigo inimigo = Models.Inimigo.vida inimigo <= 0

morte:: IO()
morte = do
    putStrLn "Você morreu, sei que é complicado digerir isso mas é um jogo então sempre da pra voltar! Porém, você perdeu TODAS AS MOEDAS.\n"
    esperandoEnter
