module Models.Conquista where

    data Conquista = Conquista {
    nomeC:: String,
    descricao :: String,
    alcancou:: Bool
} deriving (Show, Read)