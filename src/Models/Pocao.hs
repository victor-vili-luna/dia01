module Models.Pocao where

    data Pocao = Pocao {
        nome::String,
        vida::Int,
        preco::Int,
        defesa::Int,
        ataque::Int,
        quantidade::Int
    } deriving (Show, Read)

    getNomePocao::Pocao -> String
    getNomePocao =  nome

    getPrecoPocao:: Pocao -> Int
    getPrecoPocao = preco

    getQuantidadePocao:: Pocao -> Int
    getQuantidadePocao = quantidade