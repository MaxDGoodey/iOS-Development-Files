// xcode: set sdk=iOS

//  Protocols 1.swift
//  Lab for SB07. Due at the start of the next class.
//
//  How to use this file:
//  1. Open any Xcode project. Your project from a previous lab is fine.
//  2. Drag this file into it.
//  3. Open the canvas with Editor > Canvas. Each Part below shows up as its own
//     tab across the top. Click a tab to run that Part.
//  4. Work top to bottom. Write your answers to the written questions in
//     comments, right under the question.
//
//  This needs Xcode 26 or newer. The #Playground macro does not exist before that.

import Playgrounds

// Part 1 - Reading a Protocol

// A protocol on its own does nothing. It is a list of requirements.

protocol Chargeable {
    var batteryPercent: Int { get }
    var isPluggedIn: Bool { get set }
    func plugIn()
}

// 1.1 Name what it requires.
//     Write one sentence for each of the three lines inside Chargeable, saying
//     what a conforming type has to provide.
//     a. It needs to provide a batteryPercent property with type Int
//     b. it needs to provide a isPluggedIn var property with type Bool
//     c. it needs a plugIn method
//
//     Two of those requirements are properties. One of them can be declared
//     with let in a conforming type and one cannot. Which is which, and why?
//     Answer: batteryPercent can be a let property because it has { get } and isPluggedIn cannot be a let because it has { get set }

struct WirelessMouse: Chargeable {
    var batteryPercent: Int
    var isPluggedIn: Bool

    func plugIn() {
        print("Mouse is charging")
    }
}

// 1.2 Does it conform?
//     The two types below are commented out because they do not compile.
//     Decide by hand what is wrong with each one first. Then uncomment one at
//     a time, read the error Xcode gives you, and write down whether you were
//     right.

// struct SmartWatch: Chargeable {
//     var batteryPercent: Int
//     let isPluggedIn: Bool
//
//     func plugIn() {
//         print("Watch is charging")
//     }
// }
//
//     What is wrong with SmartWatch?
//     Answer: isPluggedIn is let not var

// struct ElectricScooter: Chargeable {
//     var batteryPercent: Int
//     var isPluggedIn: Bool
// }
//
//     What is wrong with ElectricScooter?
//     Answer: it has no plugIn method

// 1.3 Spot the mistake.
//     Each of the two types below has one problem. Find it, then fix it by
//     editing the code and uncommenting it.

protocol Scannable {
    var barcode: String { get }
    func scan() -> String
}

 struct LibraryBook: Scannable {
     var barcode: String

     func scan() -> String {
         return barcode
     }
 }

 struct ParkingPass: Scannable {
     var barcode: String

     func scan() -> String {
         return barcode
     }
 }

#Playground("Part 1 - Reading a Protocol") {
    let officeMouse = WirelessMouse(batteryPercent: 42, isPluggedIn: false)
    officeMouse.plugIn()
    print("Battery: \(officeMouse.batteryPercent)%")

    // Once you have fixed 1.3, create one of those types here and call scan().
    let libraryBook = LibraryBook(barcode: "19323")
    print(libraryBook.scan())
}

// Part 2 - Writing a Protocol

// 2.1 Declare a protocol called Reservable with these three requirements:
//     1. A property roomNumber of type String that can be read.
//     2. A property isAvailable of type Bool that can be read and changed.
//     3. A method reserve(forHours:) that takes an Int and returns nothing.
//
//     Write it here. Protocols have to be written outside a #Playground block.

protocol Reservable {
    var roomNumber: String { get }
    var isAvailable: Bool { get set }
    func reserve(forHours: Int) -> Void
}

// 2.2 Write a struct called StudyRoom that conforms to Reservable. Inside
//     reserve(forHours:), print a sentence with the room number and the number
//     of hours in it.
struct StudyRoom: Reservable {
    let roomNumber: String
    var isAvailable: Bool
    func reserve(forHours: Int) -> Void {
        print("Number is \(roomNumber) for \(forHours) hours.")
    }
}

// 2.3 Write a second type called TennisCourt that also conforms to Reservable.
//     Give its reserve(forHours:) a different printed message.
struct TennisCourt: Reservable {
    var roomNumber: String
    var isAvailable: Bool
    func reserve(forHours: Int) -> Void {
        print("Tennis court number \(roomNumber) rented for \(forHours) hours.")
    }
}
//     What do these two types now have in common, and what is still different
//     about them?
//     Answer: They both conform to Reservable, but they have different bodies in the reserve method.

#Playground("Part 2 - Writing a Protocol") {
    // Create a StudyRoom and call reserve(forHours: 2) on it.
    // Then create a TennisCourt and reserve it too. Watch both printouts.
    print("Part 2: write your code here")
    var myStudyRoom = StudyRoom(roomNumber: "1332", isAvailable: true)
    myStudyRoom.reserve(forHours: 2)
    var myTennisCourt = TennisCourt(roomNumber: "12", isAvailable: true)
    myTennisCourt.reserve(forHours: 2763)
}

// Part 3 - Your Own

// 3.1 Pick something you know well. Instruments, recipes, video games, tools,
//     cars. Anything works.
//
//     1. Write a protocol with at least one property requirement and at least
//        one method requirement. Use full names, not abbreviations.
//     2. Write two different types that conform to it.
//     3. Write one sentence saying what your protocol guarantees about any
//        type that conforms to it.
//        Answer: The protocol guarantees every type that conforms to it has two properties and a method with names type, istuned, and play respectively.
//
//     Write the protocol and the two types here.
protocol Instrument {
    var type: String { get }
    var isTuned: Bool { get set }
    
    func play() -> Void
}

struct Piano: Instrument {
    var type: String
    var isTuned: Bool
    
    func play() -> Void {
        if isTuned {
            print("Plink")
        } else {
            print("Plonk")
        }
    }
}

struct Guitar: Instrument {
    var type: String
    var isTuned: Bool
    
    func play() -> Void {
        if isTuned {
            print("Twang")
        } else {
            print("Twonk")
        }
    }
}

#Playground("Part 3 - Your Own") {
    // Create one of each of your two types and use them.
    print("Part 3: write your code here")
    
    var myGuitar = Guitar(type: "Acoustic", isTuned: false)
    myGuitar.play()
    
    var myPiano = Piano(type: "Grand piano", isTuned: true)
    myPiano.play()
}

// Mixed Review

// Write a protocol called Trackable with one requirement: a property
// statusDescription of type String that can be read.
//
// Then write a class called Shipment that conforms to Trackable. Give it two
// stored properties, trackingNumber of type String and hasArrived of type
// Bool. Satisfy statusDescription with a computed property that returns a
// different sentence depending on whether hasArrived is true or false.
//
// Write both here.

protocol Trackable {
    var statusDescription: String { get }
}

class Shipment: Trackable {
    var hasArrived: Bool
    
    var statusDescription: String {
        if hasArrived {
            "The package has arrived"
        } else {
            "The package is being delivered"
        }
    }
    
    init(hasArrived: Bool) {
        self.hasArrived = hasArrived
    }
}

#Playground("Mixed Review") {
    // Create two Shipment objects, one that has arrived and one that has not.
    // Print statusDescription for each.
    print("Mixed Review: write your code here")
    
    var shipment1 = Shipment(hasArrived: false)
    print(shipment1.statusDescription)
    var shipment2 = Shipment(hasArrived: true)
    print(shipment2.statusDescription)
}

// Black Diamond (optional)

#Playground("Black Diamond") {
    // A protocol says what a type must have. It never says how the type does it.
    //
    // Some developers say that makes code easier to change later. Others say it
    // adds a layer you have to go looking through to find the real work. Pick a
    // side and argue it in 3 to 5 sentences.
    //
    // Answer:

    print("Black Diamond: write your answer in the comment above")
}
