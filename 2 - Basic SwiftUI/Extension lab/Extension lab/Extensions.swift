import Foundation
import Playgrounds

extension String {
    var isNotEmpty: Bool {
        !self.isEmpty
    }
}

extension String {
    var isValidEmail: Bool {
        let emailPattern = "^\\S+@\\S+\\.\\S+$"
        return self.range(of: emailPattern, options: .regularExpression) != nil
    }
}

extension Double {
    var isInteger: Bool {
        if Double(Int(self)) == self {
            true
        } else {
            false
        }
    }
}

#Playground {
    let welcomeMessage = "Hello, world!"
    let blankMessage = ""

    print(welcomeMessage.isNotEmpty)
    print(blankMessage.isNotEmpty)
    
    let goodEmail = "student@mtec.edu"
    let badEmail = "not an email"

    print(goodEmail.isValidEmail)
    print(badEmail.isValidEmail)
    
    let wholeDouble: Double = 1
    let nonWholeDouble: Double = 0.5 
    
    print(wholeDouble.isInteger)
    print(nonWholeDouble.isInteger)
}
