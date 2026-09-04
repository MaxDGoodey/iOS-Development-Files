import UIKit

struct MadLibGenerator {
    var adjective: String
    var noun: String
    var verb: String
    var noun2: String
    var noun3: String
    var verb2: String
    var noun4: String
    var verb3: String
    var noun5: String
    var noun6: String
    
    var hasValidInput: Bool {
        if adjective.isEmpty || noun.isEmpty || verb.isEmpty || noun2.isEmpty || noun3.isEmpty || verb2.isEmpty || noun4.isEmpty || verb3.isEmpty || noun5.isEmpty || noun6.isEmpty {
            return false
        } else {
            return true
        }
    }
    
    var selectedStoryNumber: Int = randomStoryNumber()
    
    var storyTitle: String {
        switch selectedStoryNumber {
        case 1: "A Special Dinner"
        case 2: "The Strange House"
        default: "The Weird Treasure"
        }
    }
    
    static let storyCount = 3
    
    func generateMadLib() -> String {
        if hasValidInput {
            switch selectedStoryNumber {
            case 1:
                return "I decided to cook a special dinner for my \(adjective) friend, so i went to the store to buy five \(noun). Upon returning home I carefully \(verb) them into a pot filled with \(noun2) and added a tablespoon of \(noun3). suddenly, the concotion began to \(verb2) violently, startling my pet \(noun4). Before I could \(verb3), the entire kitchen was covered in \(noun5), forcing us to order \(noun6) instead."
            case 2:
                return "Once I went to a very \(adjective) house, I found a \(noun), and began to \(verb) on it. Next i found a \(noun2) with a \(noun3) on top of it. They began to \(verb2), making a \(noun4) in the room \(verb3). Before anything else could happen, i took a \(noun5) and left through the \(noun6)"
            default:
                return "There once was a very \(adjective) treasure, it has a \(noun) which automatically \(verb). It had \(noun2) with three \(noun3) holding it up. Every time the treasure \(verb2), a \(noun4) \(verb3) away from it. Finally, the greatest part of it was the \(noun5), with a \(noun6) guarding it."
            }
        } else {
            return "Invalid Input"
        }
    }
    
    static func randomStoryNumber() -> Int {
        return Int.random(in: 1...storyCount)
    }
}

var myMadLib = MadLibGenerator(adjective: "cool", noun: "house", verb: "swam", noun2: "car", noun3: "wheel", verb2: "drive", noun4: "tree", verb3: "ran", noun5: "pencil", noun6: "paper")
print(myMadLib.storyTitle)
print(myMadLib.generateMadLib())

var myMadLib2 = MadLibGenerator(adjective: "", noun: "house", verb: "swam", noun2: "car", noun3: "wheel", verb2: "drive", noun4: "tree", verb3: "ran", noun5: "pencil", noun6: "paper")
print(myMadLib2.storyTitle)
print(myMadLib2.generateMadLib())

var myMadLib3 = MadLibGenerator(adjective: "swim0", noun: "house", verb: "swam", noun2: "car", noun3: "wheel", verb2: "drive", noun4: "tree", verb3: "ran", noun5: "pencil", noun6: "paper", selectedStoryNumber: 2)
print(myMadLib3.storyTitle)
print(myMadLib3.generateMadLib())
