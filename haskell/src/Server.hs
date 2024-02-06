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
import Types.Server (TenMinuteWalkRequest)
-- import Types

type SolutionsAPI = "api" :> "status" :> Get '[JSON] NoContent
    :<|> "api" :> "solutions" :> "ten-minute-walk" :> ReqBody '[JSON] TenMinuteWalkRequest :> Post '[JSON] Bool

solutionServer :: Server SolutionsAPI
solutionServer = statusHandler :<|> tenMinuteHandler

statusHandler :: Handler NoContent
statusHandler = return NoContent -- Makes sense if you think about it

solutionsAPI :: Proxy SolutionsAPI
solutionsAPI = Proxy :: Proxy SolutionsAPI

tenMinuteHandler :: TenMinuteWalkRequest -> Handler Bool
tenMinuteHandler req = undefined -- Convert TenMinuteWalk to take the request and plugin here


-- Run in ghci
main :: IO ()
main = run 8000 (serve solutionsAPI solutionServer)
