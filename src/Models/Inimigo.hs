module Models.Inimigo(
    Inimigo(..),
    getNomeInimigo
) where 
    
    data Inimigo = Inimigo {
        nome::String,
        ataque::Int,
        defesa::Int,
        vida::Int,
        habilidadeEspecial::Int
}   deriving (Show, Read)

    getNomeInimigo:: Inimigo -> String
    getNomeInimigo = nome