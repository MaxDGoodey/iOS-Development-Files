/*:
## Exercise - Interview Questions

 Interviewers for iOS jobs often ask about algorithms, searching and sorting. Answer each question in a comment, the way you would answer it out loud in an interview. Write in your own words, 2 to 4 sentences each. Use an example from this playground where it helps.
 */





//:  1. What does Big-O describe, and why do we usually talk about the worst case?


// Answer: It describes the complexity of a function, allowing you to be able to know why your app is running slow. We usually talk about worst case because we want the worst case to be acceptable, and if we talk about any other case the worst case might not be acceptable.


//:  2. Walk me through how binary search works. When can't you use it?


// Answer: It asks if the desired item is in the upper of lower half, then asks if the item is in the upper or lower half of that half, and continues until it finds the item. You can't use this, because it only works on sorted lists. If you use it on an unsorted list, it cannot find the item.


//:  3. Your code passed every test with 20 songs, but it is slow in production with 50,000 songs. What might be going on, and how would you find out?


// Answer: What could be happening is your Big-O is too high complexity, you could find out by seeing if your code has nested loops.

//:  4. Why is merge sort faster than bubble sort on a large list?


// Answer: It's faster because of it's Big-O. Instead of O(n^2) its O(n log n) which requires much less checks.


//:  5. How would you check an array for duplicates? Now how would you make it faster?


// Answer: You could check every item in the array compared to every other item, this being O(n^2), or you could make a set of every seen item, and compare every item in the array to that set, making it O(1)


//:  6. What is recursion, and what happens if a recursive function has no base case?


// Answer: Recursion is when a function calls itself in its body. If it has no base case the function never stops and causes a stack overflow.


//:  7. Why would you use Swift's built-in `sort()` in an app instead of writing your own sort?


// Answer: It's quicker, easier, and you don't have to check for bugs.


/*:
 [Previous](@previous)  |  page 12 of 12
 */
