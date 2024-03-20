module Loja where
  
import Models.Item

lojaInicial::IO()--Provavelmente aqui vai pegar algo de arquivo
lojaInicial =
    let espadaInicial = Item {nome = "Espada de ferro", ataque = 10, defesa = 0, descricao = "Se quiser espada tem, mas só usa espada quem não se garante."}
        armaduraInicial = Item {nome = "Armadura de couro", ataque = 0, defesa = 10, descricao = "Armadura que protege contra as falacias da IA."}
        pocaoInicial = Item {nome = "Mike Tyson Mentality", ataque = 20, defesa = 0, descricao = "Perfeito para deitar I.A. no soco."}
    in putStrLn "..."

abreLoja::IO()
abreLoja = do
    --arquivo02 <- readFile "src/pacote/Loja.txt"
    putStrLn "Ainda em desenvolvimento"

mostraLojaInicial::String
mostraLojaInicial = "Aqui vou printar toda a loja do cara"



 

