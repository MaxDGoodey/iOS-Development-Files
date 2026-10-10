import SwiftUI
import Foundation

struct TitleView: View {
    @State var selectedAnswers: [Answer] = []
    @State var showInstructions: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("What Outer Wilds traveler are you?")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                Image("outerWildsTitle")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 400, height: 400)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                NavigationLink("Begin", destination: QuestionFlowView(questionIndex: 0, selectedAnswers: $selectedAnswers))
                    .font(.title)
            }
            .padding()
            .toolbar {
                Button {
                    showInstructions.toggle()
                } label: {
                    Image(systemName: "list.dash")
                }
                .scaleEffect(2)
            }
            .sheet(isPresented: $showInstructions) {
                InstructionSheet(isPresented: $showInstructions)
            }
        }
    }
}

struct InstructionSheet: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        Text("Select your answers, then select save. Keep going till you get your character.")
            .padding()
            .font(.largeTitle)
        Button("Done") {
            isPresented = false
        }
        .font(.title)
    }
}

struct QuestionFlowView: View {
    let questionIndex: Int
    @Binding var selectedAnswers: [Answer]
    @State var showListOfQuestions: Bool = false
    
    var body: some View {
        VStack {
            switch questionList[questionIndex].type {
            case .single:
                NavigationLink(questionList[questionIndex].text, destination: SingleResponseSubview(question: questionList[questionIndex], selectedAnswers: $selectedAnswers))
                    .font(.largeTitle)
            case .multiple:
                NavigationLink(questionList[questionIndex].text, destination: MultipleResponseSubview(question: questionList[questionIndex], selectedAnswers: $selectedAnswers))
                    .font(.largeTitle)
            case .ranged:
                NavigationLink(questionList[questionIndex].text, destination: RangedResponseSubview(question: questionList[questionIndex], selectedAnswers: $selectedAnswers))
                    .font(.largeTitle)
            }
        }
        .padding()
        .toolbar {
            if questionIndex + 1 < questionList.count {
                NavigationLink("Next", destination: QuestionFlowView(questionIndex: questionIndex + 1, selectedAnswers: $selectedAnswers))
                    .font(.title)
            } else {
                NavigationLink("Submit", destination: ResultsView(finalAnswers: selectedAnswers))
                    .font(.title)
            }
        }
    }
}

struct SingleResponseSubview: View {
    let question: Question
    @Binding var selectedAnswers: [Answer]
    @State var selectedAnswer: Answer?
    
    var body: some View {
        Picker("Answer", selection: $selectedAnswer) {
            ForEach(question.answers, id: \.self) {
                answer in Text(answer.text).tag(answer)
                    .font(.largeTitle)
            }
        }
        .font(.largeTitle)
        
        Button("Save") {
            if !selectedAnswers.contains(selectedAnswer!) {
                selectedAnswers.append(selectedAnswer!)
            }
            if selectedAnswers.contains(question.answers[0]) && selectedAnswer != question.answers[0] {
                if let index = selectedAnswers.firstIndex(of: question.answers[0]) {
                    selectedAnswers.remove(at: index)
                }
            }
            if selectedAnswers.contains(question.answers[1]) && selectedAnswer != question.answers[1] {
                if let index = selectedAnswers.firstIndex(of: question.answers[1]) {
                    selectedAnswers.remove(at: index)
                }
            }
            if selectedAnswers.contains(question.answers[2]) && selectedAnswer != question.answers[2] {
                if let index = selectedAnswers.firstIndex(of: question.answers[2]) {
                    selectedAnswers.remove(at: index)
                }
            }
            if selectedAnswers.contains(question.answers[3]) && selectedAnswer != question.answers[3] {
                if let index = selectedAnswers.firstIndex(of: question.answers[3]) {
                    selectedAnswers.remove(at: index)
                }
            }
        }
        .font(.title)
    }
}

struct MultipleResponseSubview: View {
    let question: Question
    @Binding var selectedAnswers: [Answer]
    @State var answer0: Bool = false
    @State var answer1: Bool = false
    @State var answer2: Bool = false
    @State var answer3: Bool = false
    
    
    var body: some View {
        Toggle(question.answers[0].text, isOn: $answer0)
        Toggle(question.answers[1].text, isOn: $answer1)
        Toggle(question.answers[2].text, isOn: $answer2)
        Toggle(question.answers[3].text, isOn: $answer3)
        
        Button("Save") {
            if answer0 {
                if !selectedAnswers.contains(question.answers[0]) {
                    selectedAnswers.append(question.answers[0])
                }
            } else {
                if let index = selectedAnswers.firstIndex(of: question.answers[0]) {
                    selectedAnswers.remove(at: index)
                }
            }
            if answer1 {
                if !selectedAnswers.contains(question.answers[1]) {
                    selectedAnswers.append(question.answers[1])
                }
            } else {
                if let index = selectedAnswers.firstIndex(of: question.answers[1]) {
                    selectedAnswers.remove(at: index)
                }
            }
            if answer2 {
                if !selectedAnswers.contains(question.answers[2]) {
                    selectedAnswers.append(question.answers[2])
                }
            } else {
                if let index = selectedAnswers.firstIndex(of: question.answers[2]) {
                    selectedAnswers.remove(at: index)
                }
            }
            if answer3 {
                if !selectedAnswers.contains(question.answers[3]) {
                    selectedAnswers.append(question.answers[3])
                }
            } else {
                if let index = selectedAnswers.firstIndex(of: question.answers[3]) {
                    selectedAnswers.remove(at: index)
                }
            }
        }
        .font(.title)
    }
}

struct RangedResponseSubview: View {
    let question: Question
    @Binding var selectedAnswers: [Answer]
    @State var sliderValue: Double = 0
    
    var body: some View {
        VStack {
            Slider(value: $sliderValue, in: 0...3, step: 1)
            HStack {
                Text(question.answers[0].text)
                Text(question.answers[1].text)
                Text(question.answers[2].text)
                Text(question.answers[3].text)
            }
            Button("Save") {
                if !selectedAnswers.contains(question.answers[Int(sliderValue)]) {
                    selectedAnswers.append(question.answers[Int(sliderValue)])
                }
                if selectedAnswers.contains(question.answers[0]) && question.answers[Int(sliderValue)] != question.answers[0] {
                    if let index = selectedAnswers.firstIndex(of: question.answers[0]) {
                        selectedAnswers.remove(at: index)
                    }
                }
                if selectedAnswers.contains(question.answers[1]) && question.answers[Int(sliderValue)] != question.answers[1] {
                    if let index = selectedAnswers.firstIndex(of: question.answers[1]) {
                        selectedAnswers.remove(at: index)
                    }
                }
                if selectedAnswers.contains(question.answers[2]) && question.answers[Int(sliderValue)] != question.answers[2] {
                    if let index = selectedAnswers.firstIndex(of: question.answers[2]) {
                        selectedAnswers.remove(at: index)
                    }
                }
                if selectedAnswers.contains(question.answers[3]) && question.answers[Int(sliderValue)] != question.answers[3] {
                    if let index = selectedAnswers.firstIndex(of: question.answers[3]) {
                        selectedAnswers.remove(at: index)
                    }
                }
            }
            .font(.title)
        }
    }
}

struct ResultsView: View {
    let finalAnswers: [Answer]
    func calculateResult(of selectedAnswers: [Answer]) throws -> TravelerType {
        guard !selectedAnswers.isEmpty else {
            throw AnswerError.noAnswers
        }
        
        var frequencyMap: [TravelerType: Int] = [:]
        
        for type in TravelerType.allCases {
            frequencyMap[type] = 0
        }
        
        for answer in selectedAnswers {
            frequencyMap[answer.type, default: 0] += 1
        }
        
        guard let winningOutcome = frequencyMap.max(by: { $0.value < $1.value })?.key else {
            throw AnswerError.noAnswers
        }
        
        return winningOutcome
    }
    
    func countForType(_ type: TravelerType) -> Int {
        return finalAnswers.filter { $0.type == type }.count
    }
    
    var resultText: String {
        do {
            return try calculateResult(of: finalAnswers).description
        } catch {
            return "You don't have any answers."
        }
    }
    
    var body: some View {
        Text(resultText)
            .font(.title)
            .padding()
        List(TravelerType.allCases, id: \.self) {type in
            Text("\(String(describing: type))")
                .font(.headline)
            Text("\(countForType(type))")
                .font(.headline)
        }
    }
}

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            TitleView()
        }
    }
}

#Preview {
    TitleView()
}
