/*:
## App Exercise - Adding to the Menu

 >These exercises reinforce Swift concepts in the context of a food truck app.

 This page is the SOLID 2 lab.

 The function below returns how many minutes an item takes to make.
 */


func prepMinutes(for itemName: String) -> Int {
    if itemName == "Street Tacos" {
        return 5
    } else if itemName == "Burrito" {
        return 8
    } else if itemName == "Nachos" {
        return 7
    }
    return 0
}

print(prepMinutes(for: "Burrito"))


//:  The truck adds nachos to the menu. Nachos take 7 minutes. Change `prepMinutes(for:)` so it returns 7 for "Nachos". Print the prep time for nachos and observe the printout.
print(prepMinutes(for: "Nachos"))




//:  In a comment, explain why `prepMinutes(for:)` breaks the Open/Closed principle.


// Why it breaks Open/Closed: This breaks the open closed principle because you have to go into the function to add a single value, making it very difficult and time wasting to add lots of items.


//:  Every truck below is a `FoodTruck`, and `serveLunch(from:)` works with any `FoodTruck`.


class FoodTruck {
    func serve(_ itemName: String) {
        print("Serving \(itemName)")
    }
}

class TacoTruck: FoodTruck {
    override func serve(_ itemName: String) {
        print("Serving \(itemName) with lime and cilantro")
    }
}

class IceCreamTruck: FoodTruck {
    override func serve(_ itemName: String) {
        if itemName != "Ice Cream" {
            fatalError("We only serve ice cream")
        }
        print("Serving \(itemName)")
    }
}

func serveLunch(from truck: FoodTruck) {
    truck.serve("Street Tacos")
}


//:  Call `serveLunch(from: TacoTruck())` and observe the printout.
serveLunch(from: TacoTruck())




//:  Predict what will happen when you call `serveLunch(from: IceCreamTruck())`. Write your prediction in a comment. Then add the call below your prediction and run it. The page will stop with an error.


// Prediction: It will fail to compile


//:  In a comment, explain which SOLID principle `IceCreamTruck` breaks and why.


// Principle: Liskov Substitution
// Why: It doesn't let IceCreamTruck() pass in place of TacoTruck, and causes an error.


/*:
 [Previous](@previous)  |  page 2 of 3  |  [Next: App Exercise - Swapping Parts](@next)
 */
