import Models.Player
import Models.Item
import Historia
import Lib
import System.IO (readFile')
import Models.Pocao

abreLojaItensInicial::IO()
abreLojaItensInicial = do
    clearScreen

    putStrLn (textoFormatado "Ferreira, o ferreiro: Olá herói! Aqui está uma lista de itens que você pode comprar caso tenha as moedas, claro:\n")
    arquivo02 <- readFile' "./src/pacote/ItensIniciais.txt"
    let lojaItens = map (read::String->Item) (lines arquivo02)
    print lojaItens
    putStrLn (textoFormatado "Deseja comprar algo?\n(1)Sim.\n(2)Não.")
    input <- getLine
    if input == "1" then compraItem lojaItens
    else putStrLn "Não quer comprar hein...tudo bem."

abreLojaPocoesInicial::IO()
abreLojaPocoesInicial = do
    clearScreen

    putStrLn (textoFormatado "Ferreira, o ferreiro: Olá herói! Aqui está uma lista de poções que você pode comprar caso tenha as moedas, claro:\n")
    arquivoPocaoInicial <- readFile' "./src/pacote/PocaoInicial.txt"
    let lojaPocao = map (read::String->Pocao) (lines arquivoPocaoInicial)
    print lojaPocao
    putStrLn (textoFormatado "Deseja comprar algo?\n(1)Sim.\n(2)Não.")
    input <- getLine
    if input == "1" then compraPocao lojaPocao
    else putStrLn "Não quer comprar hein...tudo bem."

compraItem::[Item]->IO()
compraItem lojaItens = do
    putStrLn "Digite o nome do item que você deseja comprar."
    input <- getLine
    let maybeItem = identificaItem input lojaItens
    case maybeItem of
        Just item -> do
            arquivoHero <- readFile' "./src/pacote/Heroi.txt"
            let heanesPre = read arquivoHero :: Player
                gold01 = Models.Player.gold heanesPre
                precoItem = Models.Item.preco item
            if gold01 >= precoItem then do
                let goldAtual = gold01 - precoItem
                    itemComprado = pegaItem input (equipamentos heanesPre)
                    listaItensAtualizada = equipamentos heanesPre ++ [itemComprado]
                    heanesAdulto = heanesPre { gold = goldAtual, equipamentos = listaItensAtualizada}
                    listaItensIniciais = removeItem input lojaItens
                writeFile "./src/pacote/Heroi.txt" (show heanesAdulto)
                writeFile "./src/pacote/ItensInicias.txt" (show listaItensIniciais)
                putStrLn "Compra realizada com sucesso."
            else do
                putStrLn "Está pobre, tente outro item."
                abreLojaItensInicial
        Nothing -> do
            putStrLn "Por favor tente novamente."
            abreLojaItensInicial


compraPocao::[Pocao]->IO()
compraPocao lojaPocao = do
    putStrLn "Digite o nome da pocao que você deseja comprar."
    input01 <- getLine
    let maybePocao = identificaPocao input01 lojaPocao
    case maybePocao of
        Just pocao -> do
            arquivoHeroi <- readFile' "./src/pacote/Heroi.txt"
            let heanesPre = read arquivoHeroi :: Player
                gold = Models.Player.gold heanesPre
                precoPocao = Models.Pocao.preco pocao
            if gold >= precoPocao then
                if identificaPocaoJaComprada input01 (pocoes heanesPre) then do
                    let goldAtual = gold - precoPocao
                        pocaoInicial = pegaPocao input01 (pocoes heanesPre)
                        quantidadeAtual = Models.Pocao.quantidade pocaoInicial + 1
                        pocaoFinal = pocaoInicial {quantidade = quantidadeAtual}
                        listaPocoesAtualizada = removePocaoAntiga input01 (pocoes heanesPre) ++ [pocaoFinal]
                        heanesAdulto = heanesPre { gold = goldAtual, pocoes = listaPocoesAtualizada}
                    writeFile "./src/pacote/Heroi.txt" (show heanesAdulto)
                    putStrLn "Compra realizada com sucesso."
                else do
                    let goldAtual = Models.Player.gold heanesPre - Models.Pocao.preco pocao
                        heanesAdulto = heanesPre { gold = goldAtual, pocoes = pocoes heanesPre ++ [pocao] }
                    writeFile "./src/pacote/Heroi.txt" (show heanesAdulto)
                    putStrLn "Compra realizada com sucesso."
            else do
                putStrLn "Está pobre"
                abreLojaPocoesInicial
        Nothing -> do
            putStrLn "Por favor tente novamente"
            abreLojaPocoesInicial

identificaItem::String->[Item]->Maybe Item
identificaItem nomeItem [] = Nothing
identificaItem nomeItem (item:itemSequente)
    | Models.Item.nome item == nomeItem = Just item
    | otherwise = identificaItem nomeItem itemSequente

pegaItem::String->[Item]->Item
pegaItem _ [] = error "Item errado" --nunca chega nesse codigo
pegaItem nomeItem (a:as)
    | Models.Item.nome a == nomeItem = a
    | otherwise = pegaItem nomeItem as

removeItem::String->[Item]->[Item]
removeItem _ [] = []
removeItem nomeItem (a:as)
    | Models.Item.nome a == nomeItem = as
    | otherwise = a : removeItem nomeItem as

identificaPocao::String->[Pocao]->Maybe Pocao
identificaPocao nomePocao [] = Nothing
identificaPocao nomePocao (pocao:pocaoSequente)
    | Models.Pocao.nome pocao == nomePocao = Just pocao
    | otherwise = identificaPocao nomePocao pocaoSequente

identificaPocaoJaComprada::String->[Pocao]->Bool
identificaPocaoJaComprada _ [] = False
identificaPocaoJaComprada nomePocao (a:as)
    | Models.Pocao.nome a == nomePocao = True
    | otherwise = identificaPocaoJaComprada nomePocao as

pegaPocao::String->[Pocao]->Pocao
pegaPocao _ [] = error "Poção errada" --nunca chega nesse codigo
pegaPocao nomePocao (a:as)
    | Models.Pocao.nome a == nomePocao = a
    | otherwise = pegaPocao nomePocao as

removePocaoAntiga::String->[Pocao]->[Pocao]
removePocaoAntiga _ [] = []
removePocaoAntiga nomePocao (a:as)
    | Models.Pocao.nome a == nomePocao = as
    | otherwise = a : removePocaoAntiga nomePocao as

verLoja::IO()
verLoja = do
    putStrLn "Esses são os itens e os preços que quando você trabalhar, poderá comprar: \n"
    arquivo02 <- readFile' "./src/pacote/ItensIniciais.txt"
    let loja = map (read::String->Item) (lines arquivo02)
    print loja
    putStrLn "\nMas como você ainda não possui nenhum tostão, acho melhor você pensar em fazer alguma outra coisa..."
    putStrLn "\n------------------------------------------------------------------------------------\n"



