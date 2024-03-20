module Models.Local where

    data Local = Local {
        descricao::String,
        personagem::String
    } deriving (Show, Read)