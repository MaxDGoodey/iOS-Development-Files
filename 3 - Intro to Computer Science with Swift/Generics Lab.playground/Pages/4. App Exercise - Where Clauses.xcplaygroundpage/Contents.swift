/*:
## App Exercise - Where Clauses

 >These exercises reinforce Swift concepts in the context of a coffee shop ordering app.

 A `where` clause is another place to write a constraint. It goes after the return type, before the `{`, like `-> T? where T: Comparable {`.
 */


let drinkPrices = [4.5, 5.25, 2.5, 3.25, 4.75]
let drinkNames = ["Latte", "Mocha", "Drip Coffee", "Iced Tea", "Cold Brew"]
let ordersByCustomer = ["Ana": "Latte", "Ben": "Mocha", "Cal": "Latte", "Dee": "Iced Tea"]


//:  Write a generic function called `countAtLeast(_:in:)`. It takes a value of type `T`, with no argument label, and a `[T]`. It returns an `Int`: how many items in the array are greater than or equal to the value. Put its constraint in a `where` clause. Call it with `4.5` and `drinkPrices`. It should return 3.
func countAtLeast<T>(_ value: T, in list: [T]) -> Int where T: Comparable {
    var amount = 0
    for item in list {
        if item >= value {
            amount += 1
        }
    }
    return amount
}

print(countAtLeast(4.5, in: drinkPrices))


//:  Call `countAtLeast(_:in:)` with `"L"` and `drinkNames`. Before you run it, write in a comment how many names you expect it to count. Then print the result and check your prediction.


// Prediction: 2

print(countAtLeast("L", in: drinkNames))
//:  Write a function called `countMatches(of:in:)` with two type parameters, `Key` and `Value`. It takes a `Value` and a `[Key: Value]` dictionary. It returns an `Int`: how many values in the dictionary are equal to the given value. Use a `where` clause for the constraint `Value` needs. Call it to count how many customers in `ordersByCustomer` ordered a `"Latte"`. It should return 2. (Hint: `for (_, value) in dictionary` loops over just the values.)
func countMatches<Key, Value>(of: Value, in dictionary: [Key: Value]) -> Int where Value: Equatable {
    var amount = 0
    
    for (_, value) in dictionary {
        if value == of {
            amount += 1
        }
    }
    
    return amount
}

countMatches(of: "Latte", in: ordersByCustomer)


//:  In a comment, rewrite the first line of `countAtLeast(_:in:)` with its constraint inside the angle brackets instead. Then explain why a `where` clause is easier to read for `countMatches(of:in:)`.
// countAtLeast<Key, Value: Equatable>(of: Value, in dictionary: [Key: Value]) -> Int

// Answer: Because there is two types, the constraint is harder to read on which type its on. Using a where allows you to see easily what type is being constrained.


/*:
 [Previous](@previous)  |  page 4 of 6  |  [Next: Exercise - Building a Queue](@next)
 */
