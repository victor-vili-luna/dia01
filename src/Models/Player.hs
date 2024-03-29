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
        pocoes::[Pocao],
        progresso::Int
    } deriving (Show, Read)

    getProgresso :: Player -> Int
    getProgresso = progresso

    attProgresso:: Player -> Int -> Player
    attProgresso heanes novoProgresso = heanes {progresso = novoProgresso}

    getGold:: Player -> Int
    getGold = gold

    modificaGold:: Player -> Int -> Player
    modificaGold heanes goldExtra = heanes{gold = getGold heanes + goldExtra}

