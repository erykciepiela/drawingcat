{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}
module Main where

import Lib

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine

myCircle :: Diagram B
myCircle = circle 1

node :: Char -> Diagram B
node n = text [n] # fontSizeL 0.2 # fc black
      <> circle 0.15 # lw none # named n
arrowOpts = with & headLength .~ local 0.15

-- tournament :: Int -> Diagram B
-- tournament n = atPoints (trailVertices $ regPoly n 1) (map node [1..n])
--   # applyAll [connectOutside' arrowOpts j k | j <- [1 .. n-1], k <- [j+1 .. n]]

-- example = tournament 6

simpleCategory :: [Char] -> Diagram B
simpleCategory n = atPoints (trailVertices $ regPoly (length n) 1) (map node n)

main :: IO ()
main = mainWith $ simpleCategory ['A'..'F'] 
    # connectOutside' (with & headLength .~ local 0.05) 'A' 'C' 
    # connectOutside' (with & headLength .~ local 0.05) 'A' 'B'

-- main = someFunc
