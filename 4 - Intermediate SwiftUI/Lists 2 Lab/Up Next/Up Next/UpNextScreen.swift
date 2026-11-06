//
//  UpNextScreen.swift
//  Up Next
//

import SwiftUI

struct UpNextScreen: View {
    @State private var episodes = [
        "The Race to Build the Space Station",
        "How Pizza Took Over the World",
        "Why Octopuses Are So Smart",
        "Living on Mars: Is It Possible?",
        "The Secret Life of Bees",
        "Space Junk and Why It Matters",
        "The Science of Sleep",
        "Who Invented the Video Game?",
        "Mysteries of the Deep Ocean",
        "Packing for a Trip to Space"
    ]
    
    var filteredParks: [String] {
        if searchText.isEmpty {
            return episodes
        }
        return episodes.filter {
            $0.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    @State var searchText = ""
    
    func deleteItems(at offsets: IndexSet) {
        episodes.remove(atOffsets: offsets)
    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(filteredParks, id: \.self) { episode in
                    Text(episode)
                        .swipeActions(edge: .leading) {
                            Button("Play Next", systemImage: "play") {
                                episodes.remove(at: episodes.firstIndex(of: episode)!)
                                episodes.insert(episode, at: 0)
                            }
                        }
                        .tint(.blue)
                }
                .onDelete(perform: deleteItems)
                .onMove {
                    source, destination in
                        episodes.move(fromOffsets: source, toOffset: destination)
                }
            }
            .toolbar {
                EditButton()
            }
            .navigationTitle("Up Next")
            .searchable(text: $searchText, prompt: "Search")
        }
    }
}

#Preview {
    UpNextScreen()
}
