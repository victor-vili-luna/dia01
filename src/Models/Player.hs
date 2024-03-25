module Models.Player where
    import Models.Pocao
    import Models.Item

    data Player = Player {
        nome::String,
        vida::Int,
        gold::Int,
        defesa::Int,
        ataque::Int,
        equipamentos::[Item],
        pocoes::[Pocao]
    } deriving (Show, Read)

