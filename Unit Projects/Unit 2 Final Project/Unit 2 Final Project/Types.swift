import Foundation

enum AnswerError: Error {
    case noAnswers, noAnswerSelected
}

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}

struct Answer: Hashable {
    var text: String
    var type: TravelerType
}

enum TravelerType: CaseIterable {
    case feldspar, gabbro, chert, esker, riebeck
    
    var description: String {
        switch self {
        case .feldspar:
            "Daring, bold, a daredevil. You aren't scared to try new things, and challenge yourself constantly. You treat life like a rollercoaster."
        case .gabbro:
            "Laidback, chill, calm. You don't let anything bring you down, and stay stressfree. You treat life like something to sail smoothly through."
        case .chert:
            "Explorative, ambitious, full of wonder. You know that you're a speck in the universe, and that doesnt bother you. You treat life like a place to learn new things."
        case .esker:
            "Cozy, down to earth, friendly. The thing you care most about are your friends and family. You treat life like a camera to keep memories in."
        case .riebeck:
            "Nervous, excited, hopeful. Despite the stresses and shortcomings in your life, you still try to find the good things in it. You treat life like an adventure."
        }
    }
}

let questionList: [Question] = [
    Question(
        text: "Your friends go on a huge rollercoaster, what do you do?",
        type: .single,
        answers: [
            Answer(text: "I'm the one to suggest we go on it.", type: .feldspar),
            Answer(text: "I'm up for anything my friends are up to.", type: .esker),
            Answer(text: "I'll go on it, but I won't like it.", type: .riebeck),
            Answer(text: "People die on these things, no way.", type: .chert)
        ]
    ),
    Question(
        text: "You have a test coming up, how much do you study?",
        type: .ranged,
        answers: [
            Answer(text: "Study?", type: .gabbro),
            Answer(text: "Right before the test.", type: .feldspar),
            Answer(text: "30 minutes everyday.", type: .chert),
            Answer(text: "2 hours a day at LEAST.", type: .riebeck)
        ]
    ),
    Question(
        text: "Which of these instruments would you like to/do play?",
        type: .multiple,
        answers: [
            Answer(text: "Guitar", type: .riebeck),
            Answer(text: "Harmonica", type: .feldspar),
            Answer(text: "Drums", type: .chert),
            Answer(text: "Flute", type: .gabbro)
        ]
    ),
    Question(
        text: "What's your favorite fruit out of these?",
        type: .single,
        answers: [
            Answer(text: "Raspberries", type: .esker),
            Answer(text: "Apples", type: .riebeck),
            Answer(text: "Durian", type: .feldspar),
            Answer(text: "Bananas", type: .gabbro)
        ]
    )
]
