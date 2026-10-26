import SwiftUI

struct TopicDetailView: View {
    let topic: Topic

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                ForEach(topic.summary) { qa in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(qa.question)
                            .font(.headline)
                        Text(qa.answer)
                            .foregroundStyle(.secondary)
                    }
                }
                VStack(alignment: .leading, spacing: 8) {
                    Label("Example", systemImage: "lightbulb")
                        .font(.headline)
                    Text(topic.example)
                        .font(.callout)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.quaternary, in: RoundedRectangle(cornerRadius: 12))
                }
            }
            .padding()
        }
        .navigationTitle(topic.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

enum TitleOrder: String, CaseIterable, Identifiable {
    case aToZ = "A to Z"
    case zToA = "Z to A"

    var id: String { rawValue }
}

struct ContentView: View {
    @State private var sortOrder: TitleOrder = .aToZ
    
    private var sortedTopics: [Topic] {
        selectionSort(Topic.all, ascending: sortOrder == .aToZ)
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Picker("Sort order", selection: $sortOrder) {
                    ForEach(TitleOrder.allCases) { order in
                        Text(order.rawValue).tag(order)
                    }
                }
                .pickerStyle(.segmented)
                .padding()

                List(sortedTopics) { topic in
                    NavigationLink {
                        TopicDetailView(topic: topic)
                    } label: {
                        Label(topic.title, systemImage: topic.icon)
                            .font(.headline)
                            .padding(.vertical, 6)
                    }
                }
            }
            .navigationTitle("How Computers Work")
        }
    }
}

#Preview {
    ContentView()
}
