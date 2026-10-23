/*:
## Exercise - Set vs Array Lookup

 The app warns the user when a song shows up twice in their recently played list. Below are two functions that do the same job. One uses nested loops. The other uses a `Set`, because `contains` on a `Set` jumps straight to the answer without searching.
 */


func hasDuplicatesSlow(_ songIDs: [Int]) -> Bool {
    var steps = 0
    for (firstIndex, firstID) in songIDs.enumerated() {
        for (secondIndex, secondID) in songIDs.enumerated() {
            steps += 1
            if firstIndex != secondIndex && firstID == secondID {
                print("Slow version: found a duplicate after \(steps) steps")
                return true
            }
        }
    }
    print("Slow version: no duplicates after \(steps) steps")
    return false
}

func hasDuplicatesFast(_ songIDs: [Int]) -> Bool {
    var steps = 0
    var seenSongIDs: Set<Int> = []
    for songID in songIDs {
        steps += 1
        if seenSongIDs.contains(songID) {
            print("Fast version: found a duplicate after \(steps) steps")
            return true
        }
        // Add the insert here
        seenSongIDs.insert(songID)
    }
    print("Fast version: no duplicates after \(steps) steps")
    return false
}

let recentlyPlayed = [12, 5, 31, 8, 5, 19]


//:  Run the calls below. The fast version gives the wrong answer. In a comment, explain why it can never find a duplicate yet.


_ = hasDuplicatesSlow(recentlyPlayed)
_ = hasDuplicatesFast(recentlyPlayed)

// Why the fast version is wrong:
// it never adds anything to the set meaning no duplicates are checked

//:  Fix the fast version. On the line that says `// Add the insert here`, add `seenSongIDs.insert(songID)`. Run the page again and check that both versions now find the duplicate.





//:  Both functions below get 100 song IDs with no repeats, so neither one can stop early. Before you run them, predict the steps for each one in a comment. Then fill in the Big-O for each.


let longHistory = Array(1...100)

// Prediction for slow: 10000
// Prediction for fast: 100

_ = hasDuplicatesSlow(longHistory)
_ = hasDuplicatesFast(longHistory)

// Big-O of hasDuplicatesSlow: O(n^2)
// Big-O of hasDuplicatesFast: O(n)


//:  In a comment, explain why `seenSongIDs.contains(songID)` is faster than searching an array for the same ID.
// searching an array means you have to compare every item to every other item, when using a set you only have to check each item oompared to the whole set




/*:
 [Previous](@previous)  |  page 8 of 12  |  [Next: App Exercise - Rank the Growth](@next)
 */
