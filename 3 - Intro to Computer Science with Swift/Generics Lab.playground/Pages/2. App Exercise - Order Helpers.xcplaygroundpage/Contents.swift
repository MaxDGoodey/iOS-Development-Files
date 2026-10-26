/*:
## App Exercise - Order Helpers

 >These exercises reinforce Swift concepts in the context of a coffee shop ordering app.

 The coffee shop app keeps several kinds of lists: drinks on the menu, customer names and the tips left today. Generic functions let the app use the same helpers for all of them.
 */


struct Drink {
    let name: String
    let price: Double
}

let morningDrinks = [
    Drink(name: "Latte", price: 4.5),
    Drink(name: "Mocha", price: 5.25),
    Drink(name: "Drip Coffee", price: 2.5)
]
let afternoonDrinks = [
    Drink(name: "Iced Tea", price: 3.25),
    Drink(name: "Cold Brew", price: 4.75)
]
let customerNames: [String] = ["Ana", "Ben", "Cal", "Dee", "Eli"]
let tipsByCustomer: [String: Double] = ["Ana": 1.5, "Ben": 2.0]
let favoriteDrink: String? = nil
let customerNamesFull: Array<String> = ["Ana", "Ben", "Cal", "Dee", "Eli"]
let tipsByCostumerFull: Dictionary<String, Double> = ["Ana": 1.5, "Ben": 2.0]
let favoriteDrinkFull: Optional<String>
//:  Rewrite the declarations of `customerNames`, `tipsByCustomer` and `favoriteDrink` on new lines, using each type's full generic name. Give each one the same value, and add `Full` to the end of each new name, like `customerNamesFull`.





//:  Write a generic function called `combine(_:_:)`. It takes two `[T]` arguments with no argument labels, and returns a `[T]` with every item from the first array followed by every item from the second. Use it to make `allDrinks` from `morningDrinks` and `afternoonDrinks`. Print how many drinks are in `allDrinks`.
func combine<T>(_ list1: [T], _ list2: [T]) -> [T] {
    var combinedList = list1 + list2
    return combinedList
}

let allDrinks = combine(morningDrinks, afternoonDrinks)
print(allDrinks.count)

//:  Write a generic function called `everyOther(_:)` that takes a `[T]` and returns a new `[T]` holding only the items at even indexes: 0, 2, 4, and so on. (Hint: an index is even when `index % 2 == 0`.) The app uses it to shade every other row on the menu. Call it with `customerNames` and print the result.
func everyOther<T>(_ list: [T]) -> [T] {
    var evenIndexedList: [T] = []
    for index in 0...(list.count - 1) {
        if index % 2 == 0 {
            evenIndexedList.append(list[index])
        }
    }
    return evenIndexedList
}

print(everyOther(customerNames))


//:  Call `everyOther(_:)` with `allDrinks`. Print the `name` of each drink it returns. Your `Drink` struct worked without any changes to `everyOther(_:)`. In a comment, explain why.
var list = everyOther(allDrinks)

for item in list {
    print(item.name)
}

// Answer: T can take any arguement type, including a Drink.


//:  Here is a function that adds up the price of every drink. In a comment, explain why it can't be rewritten as a generic function that takes a plain `[T]`.


func totalPrice(of drinks: [Drink]) -> Double {
    var total = 0.0
    for drink in drinks {
        total += drink.price
    }
    return total
}

// Answer: For one, it returns a different type than the parameter, and also it only takes in types with the property price


/*:
 [Previous](@previous)  |  page 2 of 6  |  [Next: Exercise - Constraints](@next)
 */
