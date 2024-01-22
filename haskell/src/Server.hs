{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeOperators     #-}
{-# LANGUAGE DataKinds         #-}
{-# LANGUAGE TypeFamilies      #-}

module Server where

import Control.Monad.Trans.Except (throwE)
import Data.ByteString.Lazy (ByteString)
import qualified Data.Map as M
import Data.List
import Data.Proxy
import Data.Text.Lazy hiding (filter)
import Data.Text.Lazy.Encoding
import Data.Text hiding (filter)
import Network.HTTP.Types
import Network.Wai
import Network.Wai.Handler.Warp
import Servant
import Servant.Docs
import Servant.Docs.Internal (ToAuthInfo(..), DocAuthentication(..))
import Servant.Server.Experimental.Auth
-- import Types

type SolutionsAPI = "api" :> "status" :> Get '[JSON] Bool

solutionServer :: Server SolutionsAPI
solutionServer = statusHandler

statusHandler :: Handler Bool
statusHandler = return True

solutionsAPI :: Proxy SolutionsAPI
solutionsAPI = Proxy :: Proxy SolutionsAPI

-- Run in ghci
main :: IO ()
main = run 8000 (serve solutionsAPI solutionServer)