module Models.Inimigo(
    Inimigo(..)
) where 
    
    data Inimigo = Inimigo {
        nome::String,
        ataque::Int,
        defesa::Int,
        vida::Int,
        habilidadeEspecial::Int
}   deriving (Show, Read)