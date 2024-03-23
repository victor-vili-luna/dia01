module Lib where

    import System.Process

    textoFormatado::String->String
    textoFormatado texto = texto ++ "\n-----------------------------------------------------------------------------------------------------------------------------------------------------------------------\n"

    clearScreen::IO()
    clearScreen = do
        _ <- system "clear"
        putStr "\ESC[H"
    