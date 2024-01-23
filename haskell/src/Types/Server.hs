module Types.Server (TenMinuteWalkRequest) where


type TenMinuteWalkRequest =
    { directions :: Directions    
    } deriving (Show, Eq, Generic)


type Direction
    = N
    | S
    | E
    | W
    deriving (Show, Eq, Generic)


tenMinuteFromString :: String -> Direction
tenMinuteFromString s =
    case s of
        "n" -> Just N
        "s" -> Just S
        "w" -> Just W
        "e" -> Just E
        "N" -> Just N
        "W" -> Just W
        "E" -> Just E
        "S" -> Just S
        _ -> Nothing


instance FromJSON Direction
    parseJSON = undefined