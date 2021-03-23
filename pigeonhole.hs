module Pigeonhole where

{-
The Pigeonhole Problem

Allocate 't' tasks to 'c' cores as evenly as possible 
by task sequence number.

Created: March 20, 2021

-}

---------------------------------------------------------------------------
{-
This is the main function that solves the problem.

In the general case, the result is a list containing lists of two sizes:
the first few lists have size 'ceiling (tasks/cores)' while the remaining
lists have size 'floor (tasks/cores)'.

For example, if tasks = 10 and cores = 7, ceiling (10/7) = 2 and
floor (10/7) = 1. 

Since 10 mod 7 is 3, the first 3 elements of the return
list will contain 2 elements each and the remaining 7-3 = 4 elements will
be lists of 1 item each, as follows:
[[1, 2], [3, 4], [5, 6], [7], [8], [9], [10]]

The function creates the two lists of different sizes separately by
calling 'createBucketList' twice and concatenating the two results
(many ++ few).

Test cases:
createAllocList 10 7
createAllocList 5 8
createAllocList 12 6

There's no error checking; these functions do not check for 
non-positive input parameters.
-} 
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
  
----------------------------------------------------------------------------
{-
Helper function. Given a start integer, the number of elements in each 
bucket (c) and the number of buckets (n), return a list of lists of integers.

Example:
createBucketList 10 2 4 returns
[[10, 11], [12, 13], [14, 15], [16, 17]]
There are 4 buckets with two numbers in each bucket, starting from 10.

createBucket 1 1 5 will return
[[1], [2], [3], [4], [5]]

-}
createBucketList :: Int -> Int -> Int -> [[Int]]
createBucketList start c n = [
  [first..last] | 
  i <- [0..n-1],
  let first = start + i * c,
  let last  = first + c -1]
