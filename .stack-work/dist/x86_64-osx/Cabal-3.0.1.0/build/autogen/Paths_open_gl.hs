{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_open_gl (
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

bindir     = "/Users/jyallop/Documents/haskell/opengl/.stack-work/install/x86_64-osx/eb7ce1bb7104ae8aea5cb68eba22d2838ca31a905c9e34f83f85c70c1907d620/8.8.3/bin"
libdir     = "/Users/jyallop/Documents/haskell/opengl/.stack-work/install/x86_64-osx/eb7ce1bb7104ae8aea5cb68eba22d2838ca31a905c9e34f83f85c70c1907d620/8.8.3/lib/x86_64-osx-ghc-8.8.3/open-gl-0.1.0.0-DL67tG7dBtb91x1jAXLUCq"
dynlibdir  = "/Users/jyallop/Documents/haskell/opengl/.stack-work/install/x86_64-osx/eb7ce1bb7104ae8aea5cb68eba22d2838ca31a905c9e34f83f85c70c1907d620/8.8.3/lib/x86_64-osx-ghc-8.8.3"
datadir    = "/Users/jyallop/Documents/haskell/opengl/.stack-work/install/x86_64-osx/eb7ce1bb7104ae8aea5cb68eba22d2838ca31a905c9e34f83f85c70c1907d620/8.8.3/share/x86_64-osx-ghc-8.8.3/open-gl-0.1.0.0"
libexecdir = "/Users/jyallop/Documents/haskell/opengl/.stack-work/install/x86_64-osx/eb7ce1bb7104ae8aea5cb68eba22d2838ca31a905c9e34f83f85c70c1907d620/8.8.3/libexec/x86_64-osx-ghc-8.8.3/open-gl-0.1.0.0"
sysconfdir = "/Users/jyallop/Documents/haskell/opengl/.stack-work/install/x86_64-osx/eb7ce1bb7104ae8aea5cb68eba22d2838ca31a905c9e34f83f85c70c1907d620/8.8.3/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "open_gl_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "open_gl_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "open_gl_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "open_gl_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "open_gl_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "open_gl_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
