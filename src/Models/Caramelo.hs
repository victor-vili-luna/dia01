module Models.Caramelo where
    
    data Caramelo = Caramelo {
        nome::String,
        ataque::Int,
        defesa::Int,
        vida::Int,
        habilidadeEspecial::Int
}   deriving(Show, Read)