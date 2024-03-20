module MundoCidadela where
import Historia
import Models.Local

dialogoPadeiro01::String
dialogoPadeiro01 = textoFormatado "Você encontra uma padaria no caminho e decide conversar com o padeiro..."

dialogoFerreira01::String
dialogoFerreira01 = textoFormatado "Heanes: Tá mas se eu vou salvar o mundo por que você só não me dá os melhores itens de uma vez? Ferreira: *cerra os olhos e diz* Amigos amigos negócios à parte meu colega."

abreMapa01::IO()
abreMapa01 = do

    putStrLn "Finalmente no mundo aberto hein... O que quer explorar??"
    putStrLn "(1) Voltar a loja do Ferreiro Ferreira para ver os itens disponíveis."
    putStrLn "(2) Conversar com o Ferreira."
    putStrLn "(3) Ir a praça da cidade."
    putStrLn "(4) Seguir Carl Wilson."

    input <- getLine
    if input == "1" then do 
        --abreLoja
        abreMapa01
    else if input == "2" then do
        putStrLn dialogoFerreira01
        abreMapa01
    else if input == "3" then do 
        putStrLn dialogoPadeiro01
        abreMapa01
    else if input == "4" then do
        putStrLn cursoHistoria02
        --SistemaGold
    else putStrLn "Escreva uma opção válida."



