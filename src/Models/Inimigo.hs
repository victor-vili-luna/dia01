<<<<<<< HEAD:src/Models/Inimigo.hs
module Models.Inimigo(
    Inimigo(..)
=======
module Models.Kanva(
    Kanva(..)
>>>>>>> 002fb1313385f9ac58109f3acba997d7809ea147:src/Models/Kanva.hs
) where 
    
    data Inimigo = Inimigo {
        nome::String,
        ataque::Int,
        defesa::Int,
        vida::Int,
        habilidadeEspecial::Int
}   deriving (Show, Read)