module CombateKanva where

import Historia
import Util.Lib

combateKanva :: IO()
combateKanva = do
    putStrLn "Sem tempo para comemorar a vitória você é puxado para dentro do museu deixando Leandro para trás."
    putStrLn kanvaHistoria
    putStrLn "Voce consegue se soltar enquanto ele divaga e dístraido, você tem chance de se preparar para o combate."

    putStrLn "Esses status são os seus atuais, mas C.W. te acompanha de longe e liberou uma poção a mais no seu inventário, veja o que quer fazer."
    heanes <- carregaPlayer
    print heanes
    
