{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
#if __GLASGOW_HASKELL__ >= 810
{-# OPTIONS_GHC -Wno-prepositive-qualified-module #-}
#endif
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_dia01 (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath




bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
<<<<<<< HEAD
bindir     = "C:\\Users\\dsout\\GitRepos\\dia01\\.stack-work\\install\\eddc65c6\\bin"
libdir     = "C:\\Users\\dsout\\GitRepos\\dia01\\.stack-work\\install\\eddc65c6\\lib\\x86_64-windows-ghc-9.6.4\\dia01-0.1.0.0-Gnc5Osjac8MI8ksz7XxduP-dia01"
dynlibdir  = "C:\\Users\\dsout\\GitRepos\\dia01\\.stack-work\\install\\eddc65c6\\lib\\x86_64-windows-ghc-9.6.4"
datadir    = "C:\\Users\\dsout\\GitRepos\\dia01\\.stack-work\\install\\eddc65c6\\share\\x86_64-windows-ghc-9.6.4\\dia01-0.1.0.0"
libexecdir = "C:\\Users\\dsout\\GitRepos\\dia01\\.stack-work\\install\\eddc65c6\\libexec\\x86_64-windows-ghc-9.6.4\\dia01-0.1.0.0"
sysconfdir = "C:\\Users\\dsout\\GitRepos\\dia01\\.stack-work\\install\\eddc65c6\\etc"
=======
bindir     = "D:\\Documents\\VsCode\\Fmcc\\dia01\\.stack-work\\install\\b69e174d\\bin"
libdir     = "D:\\Documents\\VsCode\\Fmcc\\dia01\\.stack-work\\install\\b69e174d\\lib\\x86_64-windows-ghc-9.6.4\\dia01-0.1.0.0-Gnc5Osjac8MI8ksz7XxduP-dia01"
dynlibdir  = "D:\\Documents\\VsCode\\Fmcc\\dia01\\.stack-work\\install\\b69e174d\\lib\\x86_64-windows-ghc-9.6.4"
datadir    = "D:\\Documents\\VsCode\\Fmcc\\dia01\\.stack-work\\install\\b69e174d\\share\\x86_64-windows-ghc-9.6.4\\dia01-0.1.0.0"
libexecdir = "D:\\Documents\\VsCode\\Fmcc\\dia01\\.stack-work\\install\\b69e174d\\libexec\\x86_64-windows-ghc-9.6.4\\dia01-0.1.0.0"
sysconfdir = "D:\\Documents\\VsCode\\Fmcc\\dia01\\.stack-work\\install\\b69e174d\\etc"
>>>>>>> bfb3e5a88eb11a47af2e57ca369a3a5a2f23b2b9

getBinDir     = catchIO (getEnv "dia01_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "dia01_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "dia01_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "dia01_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "dia01_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "dia01_sysconfdir") (\_ -> return sysconfdir)



joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '\\'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/' || c == '\\'
