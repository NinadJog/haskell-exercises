# The Pigeonhole Problem

Distribute _t_ tasks numbered from _1_ to _t_ into _c_ cores (computers) as evenly as possible. 

Another way to think about it is distribute _t_ numbered balls into _c_ buckets. Return the list of tasks handled by each core as a list of lists.

We could distribute them in a round-robin manner: 1st task to the 1st core, 2nd task to the 2nd core, c-th task to the c-th core, the (c+1)th task back to the 1st core, and so on. But instead of that, distribute them to cores by consecutive task number, as in the following examples.

### Example 1
If there are 10 tasks and 7 cores, the result should be [[1, 2], [3, 4], [5, 6], [7], [8], [9], [10]]. The first 3 cores should have two tasks each, while the remaining 4 cores will have a single task each. Note that the outer list will have as many elements as the number of cores. Each element is itself a list.

### Example 2
If there are 18 tasks instead of 7, the result should be [[1, 2, 3], [4, 5, 6], [7, 8, 9], [10, 11, 12], [13, 14], [15, 16], [17, 18]] i.e. the the first 4 cores will handle 3 tasks each while the last 3 cores will handle 2 tasks each.

### Example 3
If the number of cores evenly divides the number of tasks -- for example 4 tasks in 2 cores -- then each core will handle an equal number of tasks. The result will be [[1, 2], [3, 4]]

### Example 4
If the number of tasks is less than the number of cores -- for example, 4 tasks and 6 cores -- the result should be a list of singleton tasks, as in [[1], [2], [3], [4]].
