module Models.Kanva(
    Kanva(..)
) where 
    
    data Kanva = Kanva {
        nome::String,
        ataque::Int,
        defesa::Int,
        vida::Int,
        habilidadeEspecial::Int
}   deriving (Show, Read)