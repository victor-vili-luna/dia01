module Loja where
import Models.Player
import Models.Item
import Historia ()
import Util.Lib
import System.IO (readFile')
import Models.Pocao

abreLojaItens :: String -> IO()
abreLojaItens filepath = do
    clearScreen

    putStrLn (textoFormatado "Ferreira, o ferreiro: Olá herói! Aqui está uma lista de itens que você pode comprar caso tenha as moedas, claro:\n")
    arquivo02 <- readFile' filepath
    let lojaItens = map (read::String->Item) (lines arquivo02)
    print lojaItens
    putStrLn (textoFormatado "Deseja comprar algo?\n(1)Sim.\n(2)Não.")
    input <- getLine
    if trim input == "1" then compraItem filepath lojaItens
    else putStrLn "Não quer comprar hein...tudo bem."

abreLojaPocoes::String -> IO()
abreLojaPocoes filepath = do
    clearScreen

    putStrLn (textoFormatado "Olá herói! Aqui está uma lista de poções que você pode comprar caso tenha as moedas, claro:\n")
    arquivoPocao <- readFile' filepath
    let lojaPocao = map (read::String->Pocao) (lines arquivoPocao)
    print lojaPocao
    putStrLn (textoFormatado "Deseja comprar algo?\n(1)Sim.\n(2)Não.")
    input <- getLine
    if trim input == "1" then compraPocao filepath lojaPocao
    else putStrLn "Não quer comprar hein...tudo bem."

compraItem::String->[Item]->IO()
compraItem filepath lojaItens = do
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
                putStrLn "Está pobre, tente novamente"
                abreLojaItens filepath
        Nothing -> do
            putStrLn "Por favor tente novamente."
            compraItem filepath lojaItens


compraPocao::String -> [Pocao] -> IO()
compraPocao filepath lojaPocao = do
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
                abreLojaPocoes filepath
        Nothing -> do
            putStrLn "Por favor tente novamente"
            abreLojaPocoes filepath

verLoja::IO()
verLoja = do
    putStrLn "Ferreira, o ferreiro: Olá Herói! Esses são os itens e os preços que se você tiver dinheiro, poderá comprar: \n"
    arquivo02 <- readFile' "./src/pacote/ItensIniciais.txt"
    let loja = map (read::String->Item) (lines arquivo02)
    print loja

