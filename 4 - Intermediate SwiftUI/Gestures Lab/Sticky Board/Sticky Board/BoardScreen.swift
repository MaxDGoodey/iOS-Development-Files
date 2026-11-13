//
//  BoardScreen.swift
//  Sticky Board
//

import SwiftUI

struct BoardScreen: View {
    @State private var notes = StickyNote.samples
    @State private var selectedNoteID: UUID?
    @State private var isShowingTips = false

    private let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Sticky Board")
                    .font(.largeTitle.bold())
                Spacer()
                // It's read as a button with a screenreader, and it already comes with a set style and animation when pressed, and you can put button styles on it.
                Button("Add Note") {
                    addNote()
                }
            }

            HStack {
                Image(systemName: "lightbulb")
                Text("Tips")
                Spacer()
                Image(systemName: isShowingTips ? "chevron.up" : "chevron.down")
            }
            .font(.title3)
            .contentShape(.rect)
            .onTapGesture {
                withAnimation {
                    isShowingTips.toggle()
                }
            }

            if isShowingTips {
                Text("Tap a note to select it. Double tap a note to make it a favorite. Press and hold a note to delete it.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }

            LazyVGrid(columns: columns, spacing: 16) {
                ForEach($notes) { $note in
                    NoteCard(
                        note: $note,
                        isSelected: note.id == selectedNoteID,
                        onSelect: {
                            selectedNoteID = note.id
                        },
                        onDelete: {
                            delete(note)
                        }
                    )
                }
            }

            Spacer()
        }
        .padding()
    }

    private func addNote() {
        let noteColors: [Color] = [.yellow, .pink, .mint, .orange, .cyan]
        let newNote = StickyNote(
            text: "New note \(notes.count + 1)",
            color: noteColors.randomElement() ?? .yellow
        )
        withAnimation {
            notes.append(newNote)
        }
    }

    private func delete(_ note: StickyNote) {
        if selectedNoteID == note.id {
            selectedNoteID = nil
        }
        notes.removeAll { $0.id == note.id }
    }
}

#Preview {
    BoardScreen()
}
