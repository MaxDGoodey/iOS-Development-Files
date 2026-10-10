/*:
## Exercise - Recursion

 A recursive function calls itself on a smaller piece of the problem. The base case is the part that stops the calls. Each call waits on the stack until the call it made finishes.
 */


func countdownToRelease(from secondsLeft: Int) {
    if secondsLeft == 0 {
        print("New album out now!")
        return
    }
    print("\(secondsLeft)...")
    countdownToRelease(from: secondsLeft - 1)
    // Add the "finished" print here
    print("Finished the call for \(secondsLeft)")
}


//:  In a comment, write which lines are the base case. Then predict what `countdownToRelease(from: 3)` will print.


// Base case:
// countdownToRelease(from: 0) would be the best case.
// Prediction:
// "3..." "2..." "1..." "New album out now!"

//:  Call `countdownToRelease(from: 3)` and observe the printout.
countdownToRelease(from: 3)




//:  On the line that says `// Add the "finished" print here`, add `print("Finished the call for \(secondsLeft)")`. Before you run it again, predict the order the new lines will print in. Then run it. In a comment, explain why the calls finish in the opposite order they started.


// Prediction:
// 3... 2... 1... New album out now! Finished the call for 1 Finished the call for 2 Finished the call for 3
// They finish in the opposite order because of the way the functions are nested, 1 finishes then 2 then 3.


//:  A song gets 1 play on day 1, 2 plays on day 2, 3 plays on day 3, and so on. The function below adds up all the plays through a given day.


func totalPlays(throughDay dayNumber: Int) -> Int {
    if dayNumber == 0 {
        return 0
    }
    return dayNumber + totalPlays(throughDay: dayNumber - 1)
}


//:  Predict what `totalPlays(throughDay: 4)` returns, and how many times `totalPlays` gets called in all. Then print the result and check.


// Prediction for the result: 10
// Prediction for the number of calls: 5

print(totalPlays(throughDay: 4))
//:  Do not run this one. In a comment, explain what would happen if you called `totalPlays(throughDay: -1)`, and why. Use the words base case and stack in your answer.
// It would run forever, never reaching a base case and causing a stack overflow crash




/*:
 [Previous](@previous)  |  page 10 of 12  |  [Next: Exercise - Sorting Algorithms](@next)
 */
