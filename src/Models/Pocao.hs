module Models.Pocao(
    Pocao(..)
) where

    data Pocao = Pocao {
        nome::String,
        vida::Int,
        preco::Int,
        defesa::Int,
        ataque::Int,
        quantidade::Int
    } deriving (Show, Read)