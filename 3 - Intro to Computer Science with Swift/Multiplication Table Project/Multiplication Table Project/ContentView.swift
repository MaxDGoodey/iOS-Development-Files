import SwiftUI
public import Combine

struct Question: Identifiable {
    let id = UUID()
    let multiplicand: Int
    let multiplier: Int
    var correctAnswer: Int { multiplicand * multiplier }
}

@MainActor
class QuizViewModel: ObservableObject {
    @Published var questions: [Question] = []
    @Published var currentIndex = 0
    @Published var userAnswer = ""
    @Published var finished = false
    @Published var score = 0

    private let tables: ClosedRange<Int>
    private let count: Int

    init(tables: ClosedRange<Int>, count: Int) {
        self.tables = tables
        self.count = count
        generateQuestions()
    }

    private func generateQuestions() {
        questions = (0..<count).map { _ in
            let a = Int.random(in: tables)
            let b = Int.random(in: 2...12)
            return Bool.random()
                ? Question(multiplicand: a, multiplier: b)
                : Question(multiplicand: b, multiplier: a)
        }
    }

    func restart() {
        currentIndex = 0; score = 0; userAnswer = ""; finished = false
        generateQuestions()
    }

    func submitAnswer() {
        guard let answer = Int(userAnswer.trimmingCharacters(in: .whitespaces)) else { return }
        if answer == questions[currentIndex].correctAnswer { score += 1 }
        next()
    }

    private func next() {
        if currentIndex + 1 < questions.count {
            currentIndex += 1
            userAnswer = ""
        } else {
            finished = true
        }
    }
}

struct HomeView: View {
    @State private var maxTable = 24
    let initialMaxTable = 24
    @State private var questionCount = 10

    var body: some View {
        NavigationStack {
            Form {
                Section("Tables") {
                    Stepper("Up to \(maxTable)", value: $maxTable, in: 2...initialMaxTable)
                }
                Section("Questions") {
                    Picker("Count", selection: $questionCount) {
                        Text("5").tag(5)
                        Text("10").tag(10)
                        Text("20").tag(20)
                    }
                    .pickerStyle(.segmented)
                }
                NavigationLink("Start") {
                    QuizView(tables: 2...maxTable, count: questionCount)
                }
            }
            .navigationTitle("Times Tables")
        }
    }
}

struct QuizView: View {
    @StateObject private var vm: QuizViewModel
    @Environment(\.dismiss) private var dismiss
    @FocusState private var focused: Bool

    init(tables: ClosedRange<Int>, count: Int) {
        _vm = StateObject(wrappedValue: QuizViewModel(tables: tables, count: count))
    }

    var body: some View {
        if vm.finished {
            ResultView(score: vm.score, total: vm.questions.count) { vm.restart() }
                .navigationBarBackButtonHidden()
                .toolbar {
                    Button("Settings") { dismiss() }
                }
        } else {
            let q = vm.questions[vm.currentIndex]
            VStack(spacing: 24) {
                Text("Question \(vm.currentIndex + 1) of \(vm.questions.count)")
                    .foregroundStyle(.secondary)
                Text("\(q.multiplicand) × \(q.multiplier) = ?")
                    .font(.system(size: 48, weight: .bold, design: .rounded))
                TextField("Answer", text: $vm.userAnswer)
                    .keyboardType(.numberPad)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .frame(maxWidth: 160)
                    .focused($focused)
                Button("Check") { vm.submitAnswer() }
                    .buttonStyle(.borderedProminent)
                    .disabled(Int(vm.userAnswer) == nil)
            }
            .padding()
            .onAppear { focused = true }
        }
    }
}

struct ResultView: View {
    let score: Int
    let total: Int
    let playAgain: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text("You got \(score) out of \(total) correct")
                .font(.title)
                .multilineTextAlignment(.center)
            Button("Play again", action: playAgain)
                .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
