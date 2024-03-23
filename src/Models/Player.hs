module Models.Player where
    import Models.Pocao

    data Player = Player {
        nome::String,
        vida::Int,
        gold::Int,
        defesa::Int,
        ataque::Int,
        equipamentos::String,
        pocoes::[Pocao]
    } deriving (Show, Read)

