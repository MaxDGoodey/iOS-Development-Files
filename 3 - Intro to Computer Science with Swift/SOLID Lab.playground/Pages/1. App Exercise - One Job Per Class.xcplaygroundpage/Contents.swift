/*:
## App Exercise - One Job Per Class

 >These exercises reinforce Swift concepts in the context of a food truck app.

 This page is the SOLID 1 lab.

 A class should only have one reason to change. `FoodTruckOrder` below stores an order, but it does other jobs too.
 */


class FoodTruckOrder {
    var customerName: String
    var itemNames: [String] = []
    var total = 0.0

    init(customerName: String) {
        self.customerName = customerName
    }

    func addItem(named itemName: String, price: Double) {
        itemNames.append(itemName)
        total += price
    }
}

class ReceiptPrinter {
    func printReceip(for order: FoodTruckOrder) {
        print("Receipt for \(order.customerName)")
        for itemName in order.itemNames {
            print("- \(itemName)")
        }
        print("Total: $\(order.total)")
    }
}

class OrderTexter {
    func sendOrderReadyText(for order: FoodTruckOrder) {
        print("Texting \(order.customerName): Your order is ready!")
    }
}

let tacoOrder = FoodTruckOrder(customerName: "Maya")
tacoOrder.addItem(named: "Street Tacos", price: 9.5)
tacoOrder.addItem(named: "Horchata", price: 3.25)


//:  In a comment, write what each letter in SOLID stands for. Try it from memory before you check your notes.


// S: Single responsibility
// O: Open closed
// L: liskov substitution
// I: interface segregation
// D: dependency inversion


//:  `FoodTruckOrder` does three different jobs. In a comment, name each job.


// Job 1: make a order
// Job 2: print a receipt
// Job 3: send a order ready text


//:  Split the class. Create a class called `ReceiptPrinter` with a function called `printReceipt(for order: FoodTruckOrder)`. Create a class called `OrderTexter` with a function called `sendOrderReadyText(for order: FoodTruckOrder)`. Move the code from `FoodTruckOrder` into the new functions, then delete `printReceipt()` and `sendOrderReadyText()` from `FoodTruckOrder`. Create an instance of each new class, call both functions with `tacoOrder`, and observe the printout.
var receipt: ReceiptPrinter = ReceiptPrinter()
receipt.printReceip(for: tacoOrder)
var orderTexter: OrderTexter = OrderTexter()
orderTexter.sendOrderReadyText(for: tacoOrder)




//:  The owner wants the text message to include the order total. In a comment, say which class you would open to make that change. Then explain why that is easier than it was before you split the class.


// Class to open: OrderTexter
// Why it's easier: Instead of having to go through the entire TruckOrder class and changing it, we only have to change the OrderTexter, making it easier to spot bugs and faster to find.


/*:
 page 1 of 3  |  [Next: App Exercise - Adding to the Menu](@next)
 */
