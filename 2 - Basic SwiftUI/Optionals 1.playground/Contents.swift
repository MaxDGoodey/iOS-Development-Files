import UIKit

var temperature: Double?
// Should be an optional because the reading for the temperature could malfunction causing no temperature to be read.
var testScore: Double?
// Should be an optional because the student might not have turned in a test.
var middleName: String?
// Should be an optional because the person might not have a middle name.
var discountPercentage: Double?
// Could just be a 0 percent discount, but the data would say there is no discount found, therefore should have an optional.
var patientAllergies: [String?]
// Patient could have allergies, and could not have allergies, so should be optional. Patient might also have multiple allergies so should be an array.
var guardianName: String?
// The child could be an orphan without any known parents.
var bankAccountBalance: Double
// Shouldn't be an optional, you can have no money in a bank account, which is zero, not nil.
var height: String
// Everyone has a height.
var hairColor: String?
// Person could be bald.
var currentLocation: String?
// The location services could be down.

