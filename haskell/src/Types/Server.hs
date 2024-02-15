{-# LANGUAGE DeriveGeneric         #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE RecordWildCards       #-}

module Types.Server (TenMinuteWalkRequest, Direction (..), directions) where

import GHC.Generics
import Data.Aeson
import qualified Data.Char as C

newtype TenMinuteWalkRequest = TenMinuteWalkRequest
    { directions :: [Direction]
    } deriving (Show, Eq, Generic)

-- instance FromJSON TenMinuteWalkRequest where
--     parseJSON = withObject "TenMinuteWalkRequest" $ \o -> do
--       directions <- o .: "directions"
--       pure TenMinuteWalkRequest{..}

instance FromJSON TenMinuteWalkRequest where
  parseJSON = genericParseJSON options
instance ToJSON TenMinuteWalkRequest where
  toJSON = genericToJSON options


data Direction
    = North
    | South
    | East
    | West
    deriving (Show, Eq, Generic)


tenMinuteFromString :: String -> Maybe Direction
tenMinuteFromString s =
    case C.toUpper $ head s of
        'N' -> Just North
        'W' -> Just West
        'E' -> Just East
        'S' -> Just South
        _ -> Nothing


instance FromJSON Direction
instance ToJSON Direction
-- instance Arbitrary Direction

options :: Options
options = defaultOptions
  { omitNothingFields = True
  , fieldLabelModifier = rename
  }

  where
    rename "type_" = "type"
    rename other   = other
