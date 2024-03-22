module Models.Item where

    data Item = Item {
        nome::String,
        preco::Int,
        ataque::Int,
        defesa::Int,
        descricao::String
    } deriving (Show, Read)

