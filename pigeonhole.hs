module Misc where

{-
The Pigeonhole Problem

Allocate 't' tasks to 'c' cores as evenly as possible
by task sequence number.


-}

--------------------------------------------------
createAllocList :: Int -> Int -> [[Int]]
createAllocList tasks cores 

  | tasks < cores   = [[i] | i <- [1..tasks]]
  | diff == 0       = createBucketList 1 quot cores
  | otherwise       = many ++ few
  
  where
    diff = tasks `mod` cores
    quot = tasks `div` cores
    many = createBucketList 1 (1 + quot) diff
    
    first = 1 + (1 + quot) * diff
    few   = createBucketList first quot (cores - diff)
  
--------------------------------------------------
{-
Helper function. Given a start integer, the number
of elements in each bucket (c) and the number of
buckets (n), return a list of lists of integers.

For example:


-}
createBucketList :: Int -> Int -> Int -> [[Int]]
createBucketList start c n = [
  [first..last] | 
  i <- [0..n-1],
  let first = start + i * c,
  let last  = first + c -1]
