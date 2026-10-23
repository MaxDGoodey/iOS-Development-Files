/*:
## Exercise - Protocols as Types

 In Protocols 1 you wrote protocols and made your own types conform to them. Now you'll use a protocol's name as a type. A protocol's name can go anywhere a type name can: the type of a property, the type of a parameter, or the type of an array. Anything that conforms to the protocol fits.

 Write a protocol called `Vehicle` with two requirements: a property called `wheelCount` of type `Int` that can be read, and a method called `describe()` that returns a `String`.
 */
protocol Vehicle {
    var wheelCount: Int { get }
    func describe() -> String
}




//:  Write two structs that conform to `Vehicle`: `Bicycle`, which has 2 wheels, and `DeliveryTruck`, which has 6. Each one's `describe()` should return a sentence with its number of wheels in it, like "A bicycle with 2 wheels".
struct Bicycle: Vehicle {
    var wheelCount = 2
    func describe() -> String {
        return "A bike has two wheels"
    }
}

struct DeliveryTruck: Vehicle {
    var wheelCount = 6
    func describe() -> String {
        return "A delivery truck has six wheels"
    }
}



//:  Write a struct called `ParkingSpot` with one property called `parkedVehicle`. Its type should be `Vehicle`.
struct ParkingSpot {
    var parkedVehicle: Vehicle
}




//:  Create a variable called `cornerSpot` that is a `ParkingSpot` holding a `Bicycle`. Print `cornerSpot.parkedVehicle.describe()`. Then put a `DeliveryTruck` in `cornerSpot.parkedVehicle` and print it again. Observe the printout.
var cornerSpot = ParkingSpot(parkedVehicle: DeliveryTruck())
print(cornerSpot.parkedVehicle.describe())




//:  Write a function called `printTollCost(for:)` that takes one `Vehicle` argument. The toll is $2 per wheel. Print a line like "Toll for a vehicle with 2 wheels: $4". Call the function once with a `Bicycle` and once with a `DeliveryTruck`, and observe the printout.
func printTollCost(for vehicle: Vehicle) {
    print("Toll for a vehicle with \(vehicle.wheelCount) wheels: $\(vehicle.wheelCount * 2).")
}

printTollCost(for: Bicycle())
printTollCost(for: DeliveryTruck())


//:  Create a constant called `parkingLot` of type `[Vehicle]` that holds two bicycles and one delivery truck. Use a `for`-`in` loop to print `describe()` for every vehicle in the lot.
let parkingLot: [Vehicle] = [Bicycle(), Bicycle(), DeliveryTruck()]

for vehicle in parkingLot {
    print(vehicle.describe())
}


//:  Use a second `for`-`in` loop to add up the `wheelCount` of every vehicle in `parkingLot`. Print the total. It should be 10.
var wheelCount = 0

for vehicle in parkingLot {
    wheelCount += vehicle.wheelCount
}

print(wheelCount)


//:  Try adding the number `4` to the array in `parkingLot`. Read the error, then take the `4` back out. In a comment, explain what the error is telling you.


// Answer: 4 doesnt fit in the array of vehicles, because we already declared it is an array of only things that conform to vehicles. 4 doesnt conform to vehicles, so it cannot be in the array.


/*:
 page 1 of 8  |  [Next: App Exercise - Watering Schedule](@next)
 */
