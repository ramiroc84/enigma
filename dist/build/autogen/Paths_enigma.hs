{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_enigma (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
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
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/ramiro/.cabal/bin"
libdir     = "/home/ramiro/.cabal/lib/x86_64-linux-ghc-8.6.5/enigma-0.1.0.0-FZYrvJ8KgMRLQxPGx8UB2y"
dynlibdir  = "/home/ramiro/.cabal/lib/x86_64-linux-ghc-8.6.5"
datadir    = "/home/ramiro/.cabal/share/x86_64-linux-ghc-8.6.5/enigma-0.1.0.0"
libexecdir = "/home/ramiro/.cabal/libexec/x86_64-linux-ghc-8.6.5/enigma-0.1.0.0"
sysconfdir = "/home/ramiro/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "enigma_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "enigma_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "enigma_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "enigma_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "enigma_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "enigma_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
