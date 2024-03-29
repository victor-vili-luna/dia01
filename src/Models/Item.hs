module Models.Item where

    data Item = Item {
        nome::String,
        preco::Int,
        ataque::Int,
        defesa::Int,
        descricao::String
    } deriving (Show, Read)

    getPrecoItem :: Item -> Int
    getPrecoItem = preco

    getNomeItem :: Item -> String
    getNomeItem = nome


