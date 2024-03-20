module Models.Item where

    data Item = Item {
        nome::String,
        ataque::Int,
        defesa::Int,
        descricao::String
    } deriving (Show, Read)

