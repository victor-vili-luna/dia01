module Loja where
import Models.Player
import Models.Item
import Historia ()
import Util.Lib
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
    if trim input == "1" then compraItem lojaItens
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
    if trim input == "1" then compraPocao lojaPocao
    else putStrLn "Não quer comprar hein...tudo bem."

compraItem::[Item]->IO()
compraItem lojaItens = do
    putStrLn "Digite o nome do item que você deseja comprar."
    input <- getLine
    let maybeItem = identificaItem input lojaItens
    case maybeItem of
        Just item -> do
            heanesPre <- carregaPlayer
            let gold01 = getGold heanesPre
                precoItem = getPrecoItem item
            if gold01 >= precoItem then do
                let goldAtual = gold01 - precoItem
                    listaItensAtualizada = equipamentos heanesPre ++ [item]
                    heanesAdulto = heanesPre { gold = goldAtual, equipamentos = listaItensAtualizada}
                    listaAtualItens = removeItem input lojaItens
                salvaPlayer heanesAdulto
                salvaItens listaAtualItens
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
    pocaoNome <- getLine
    let maybePocao = identificaPocao pocaoNome lojaPocao
    case maybePocao of
        Just pocao -> do
            heanesPre <- carregaPlayer
            let gold = getGold heanesPre
                precoPocao = getPrecoPocao pocao
            if gold >= precoPocao then
                if identificaPocaoJaComprada pocaoNome (pocoes heanesPre) then do
                    let goldAtual = gold - precoPocao
                        pocaoInicial = pegaPocao pocaoNome (pocoes heanesPre)
                        quantidadeAtual = getQuantidadePocao pocaoInicial + 1
                        pocaoFinal = pocaoInicial {quantidade = quantidadeAtual}
                        listaPocoesAtualizada = removePocaoAntiga pocaoNome (pocoes heanesPre) ++ [pocaoFinal]
                        heanesAdulto = heanesPre { gold = goldAtual, pocoes = listaPocoesAtualizada}
                    salvaPlayer heanesAdulto
                    putStrLn "Compra realizada com sucesso."
                else do
                    let goldAtual = gold - precoPocao
                        heanesAdulto = heanesPre { gold = goldAtual, pocoes = pocoes heanesPre ++ [pocao] }
                    salvaPlayer heanesAdulto
                    putStrLn "Compra realizada com sucesso."
            else do
                putStrLn "Está pobre"
                abreLojaPocoesInicial
        Nothing -> do
            putStrLn "Por favor tente novamente"
            abreLojaPocoesInicial

identificaItem::String->[Item]->Maybe Item
identificaItem _ [] = Nothing
identificaItem nomeItem (a:as)
    | comparaStrings (getNomeItem a) nomeItem  = Just a
    | otherwise = identificaItem nomeItem as

pegaItem::String->[Item]->Item
pegaItem _ [] = error "Item errado" --nunca chega nesse codigo
pegaItem nomeItem (a:as)
    | comparaStrings (getNomeItem a) nomeItem  = a
    | otherwise = pegaItem nomeItem as

removeItem::String->[Item]->[Item]
removeItem _ [] = []
removeItem nomeItem (a:as)
    | comparaStrings (getNomeItem a) nomeItem  = as
    | otherwise = a : removeItem nomeItem as

identificaPocao::String->[Pocao]->Maybe Pocao
identificaPocao _ [] = Nothing
identificaPocao nomePocao (a:as)
    | comparaStrings (getNomePocao a) nomePocao = Just a
    | otherwise = identificaPocao nomePocao as

identificaPocaoJaComprada::String->[Pocao]->Bool
identificaPocaoJaComprada _ [] = False
identificaPocaoJaComprada nomePocao (a:as)
    | comparaStrings (getNomePocao a) nomePocao = True
    | otherwise = identificaPocaoJaComprada nomePocao as

pegaPocao::String->[Pocao]->Pocao
pegaPocao _ [] = error "Poção errada" --nunca chega nesse codigo
pegaPocao nomePocao (a:as)
    | comparaStrings (getNomePocao a) nomePocao = a
    | otherwise = pegaPocao nomePocao as

removePocaoAntiga::String->[Pocao]->[Pocao]
removePocaoAntiga _ [] = []
removePocaoAntiga nomePocao (a:as)
    | comparaStrings (getNomePocao a) nomePocao = as
    | otherwise = a : removePocaoAntiga nomePocao as

verLoja::IO()
verLoja = do
    putStrLn "Ferreira, o ferreiro: Olá Herói! Esses são os itens e os preços que quando você trabalhar, poderá comprar: \n"
    arquivo02 <- readFile' "./src/pacote/ItensIniciais.txt"
    let loja = map (read::String->Item) (lines arquivo02)
    print loja
    putStrLn "\nMas como você ainda não possui nenhum tostão, acho melhor você pensar em fazer alguma outra coisa..."
    putStrLn "\n------------------------------------------------------------------------------------\n"



