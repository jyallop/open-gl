module Main where

import Lib
import Graphics.UI.GLFW as GLFW
import Graphics.Rendering.OpenGL.GL

main :: IO ()
main = do
    glfw <- GLFW.init
    putStrLn "Hello, World!\n"
    putStrLn "From Intro"
    window <- createWindow 500 500 "OpenGL" Nothing Nothing
    makeContextCurrent window
    GLFW.terminate

update :: IO Window -> IO ()
update = undefined