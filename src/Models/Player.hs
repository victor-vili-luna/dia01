module Models.Player where

    data Player = Player {
        nome::String,
        vida::Int,
        gold::Int,
        defesa::Int,
        ataque::Int,
        equipamentos::String,
        pocoes::String
    } deriving (Show, Read)

    getGold :: Player->Int
    getGold = gold
