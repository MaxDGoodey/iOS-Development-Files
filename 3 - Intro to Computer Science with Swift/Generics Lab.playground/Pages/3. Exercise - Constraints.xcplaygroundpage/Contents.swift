/*:
## Exercise - Constraints

 A constraint limits which types can fill in a type parameter. `T: Equatable` means `T` can be any type that can be checked with `==`. `T: Comparable` means `T` can be any type that can be put in order with `<` and `>`.

 This function won't build. Read the error, then add a constraint so it builds. Don't change anything inside the function.
 */


func position<T: Equatable>(of target: T, in items: [T]) -> Int? {
    for index in 0..<items.count {
        if items[index] == target {
            return index
        }
    }
    return nil
}


//:  Create one `[String]` and one `[Int]`. For each array, call `position(of:in:)` once with a value that is in the array and once with a value that isn't, so four calls in all. Print each result, using `??` to print `-1` when the value isn't found.
var stringList: [String] = ["1", "2", "3", "4"]
var intList: [Int] = [1, 2, 3, 4]
print(position(of: "1", in: stringList) ?? -1)
print(position(of: "0", in: stringList) ?? -1)
print(position(of: 1, in: intList) ?? -1)
print(position(of: 0, in: intList) ?? -1)
//:  Here is a struct for a concert ticket. Make `Ticket` conform to `Equatable`. Then create a `[Ticket]` with three tickets, and use `position(of:in:)` to find one of them. Print the result.


struct Ticket: Equatable {
    let row: String
    let seat: Int
}

var ticketList: [Ticket] = [Ticket(row: "A", seat: 2), Ticket(row: "B", seat: 23), Ticket(row: "E", seat: 7)]
print(position(of: Ticket(row: "A", seat: 2), in: ticketList)!)
//:  Remove `: Equatable` from `Ticket` and read the error on your `position(of:in:)` call. Put `: Equatable` back. In a comment, explain what the error was telling you.


// Answer: Position requires T to conform to Equatable, so if you remove Equatable from Ticket it can't be used as an argument for position.


//:  Write a generic function called `isBetween(_:low:high:)` that returns a `Bool`. It returns `true` when the first argument is greater than or equal to `low` and less than or equal to `high`. The first argument has no label, and all three arguments are the same type `T`. Add the constraint `T` needs. Call it with three `Int` values and with three `String` values, and print each result. (Strings are compared in alphabetical order, so `"m"` is between `"a"` and `"z"`.)
func isBetween<T: Comparable>(_ number: T, low: T, high: T) -> Bool {
    if number >= low && number <= high {
        return true
    }
    return false
}

print(isBetween(1, low: 0, high: 3))
print(isBetween("w", low: "a", high: "z"))



//:  Call `isBetween(_:low:high:)` with three `Bool` values. Read the error, then delete that line. In a comment, explain why `Bool` can't be used here but `String` can.


// Answer: String can be used here because it is comparable, while bool isnt. There is no 'higher' value for a boolean.


/*:
 [Previous](@previous)  |  page 3 of 6  |  [Next: App Exercise - Where Clauses](@next)
 */
