{-# LANGUAGE OverloadedStrings #-}

import Data.Monoid (mappend)
import Hakyll

main :: IO ()
main =
  hakyll $ do
    match "images/*" $ do
      route idRoute
      compile copyFileCompiler
    match "css/*" $ do
      route idRoute
      compile compressCssCompiler
    match
      (fromList
         [ "pages/face.md"
         , "index.md"
         , "pages/inte.md"
         , "pages/loca.md"
         , "pages/mail.md"
         , "pages/name.md"
         , "pages/posi.md"
         , "pages/yout.md"
         ]) $ do
      route $ setExtension "html"
      compile $
        pandocCompiler >>=
        loadAndApplyTemplate "templates/default.html" defaultContext >>=
        relativizeUrls
    match "templates/*" $ compile templateBodyCompiler
