import SwiftUI

struct QuestionAnswer: Identifiable {
    let id = UUID()
    var question: String
    var answer: String
}

struct Topic: Identifiable {
    let id = UUID()
    var title: String
    var icon: String
    var summary: [QuestionAnswer]
    var example: String
}

func selectionSort<T: Comparable>(_ items: [T], ascending: Bool = true) -> [T] {
    var result = items

    for i in 0..<result.count {
        var best = i 

        for j in (i + 1)..<result.count {
            let isBetter = ascending ? result[j] < result[best]
                                     : result[best] < result[j]
            if isBetter {
                best = j
            }
        }

        if best != i {
            result.swapAt(i, best)
        }
    }
    return result
}

extension Topic: Comparable {
    static func == (lhs: Topic, rhs: Topic) -> Bool {
        lhs.title.lowercased() == rhs.title.lowercased()
    }

    static func < (lhs: Topic, rhs: Topic) -> Bool {
        lhs.title.lowercased() < rhs.title.lowercased()
    }
}
