module Pagination where


-- For this exercise you will be strengthening your page-fu mastery. You will complete the PaginationHelper class, which is a utility class helpful for querying paging information related to an array.
-- The class is designed to take in an array of values and an integer indicating how many items will be allowed per each page. The types of values contained within the collection/array are not relevant.
-- The following are some examples of how this class is used:

-- collection   = ['a','b','c','d','e','f']
-- itemsPerPage = 4

-- pageCount collection itemsPerPage       `shouldBe` 2

-- itemCount collection itemsPerPage       `shouldBe` 6

-- pageItemCount collection itemsPerPage 0 `shouldBe` Just 4 -- four of six items
-- pageItemCount collection itemsPerPage 1 `shouldBe` Just 2 -- the last two items
-- pageItemCount collection itemsPerPage 3 `shouldBe` Nothing -- page doesn't exist

-- pageIndex collection itemsPerPage  0    `shouldBe` Just 0 -- zero based index
-- pageIndex collection itemsPerPage  5    `shouldBe` Just 1 
-- pageIndex collection itemsPerPage 20    `shouldBe` Nothing
-- pageIndex collection itemsPerPage (-20) `shouldBe` Nothing



type Collection a = [a]
type ItemsPerPage = Int

itemCount :: Collection a -> Int
itemCount = length

pageCount :: Collection a -> ItemsPerPage -> Int
pageCount xs n = ceiling $ fromIntegral (itemCount xs) / fromIntegral n

pageItemCount :: Collection a -> ItemsPerPage -> Int -> Maybe Int
pageItemCount xs n 0 = Just n -- First page is always ItemsPerPage
pageItemCount xs n page
    | (page + 1) > pageCount xs n = Nothing -- Out of bounds
    | (page + 1) < pageCount xs n = Just n -- before last page is always itemsPerPage number
    | otherwise                   = Just $ itemCount xs `rem` n -- Last page

pageIndex :: Collection a -> ItemsPerPage -> Int -> Maybe Int
pageIndex xs n item
    | itemCount xs < (item + 1) = Nothing -- Item does not exist in collection
    | itemCount xs > (item + 1) = Just 0 -- Item is on first page