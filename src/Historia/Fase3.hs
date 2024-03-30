module Historia.Fase3 where

kanvaCW :: IO()
kanvaCW = do
        putStrLn "CW: Parabéns pela vitória héroi, eu estava assistindo de longe, tamanha destreza sim, vou liberar uma ultima pocao para voce, mas ela é muito mais cara. Mas será absolutamente necessária se quiser derrotar o inominável, boa sorte na sua última aventura professor, se não me engano o ferreiro estava querendo falar com você." 
        posKanva

posKanva :: IO()
posKanva = do
        putStrLn "(1) Ganhar dinheiro.\n(2) Visitar o ferreiro Ferreira\n(3) Ver a nova poção.\n(4) Investigar o inominável."
        input <- getLine
        
        if trim input == "1" then do
            clearScreen
            sistemaGold
        else if trim input == "2" then do
            clearScreen
            abreLojaItens itemFinal
            posKanva
        else if trim input == "3" then do
            clearScreen
            abreLojaPocoes pocaoFinal
            posKanva
        else if trim input == "4" then do
            clearScreen
            putStr historiaConversaGPT
            combateGPT01
        else do
            clearScreen
            putStrLn "Digite uma opção válida."