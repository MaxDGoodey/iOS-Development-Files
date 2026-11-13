//
//  NoteCard.swift
//  Sticky Board
//

import SwiftUI

struct NoteCard: View {
    @Binding var note: StickyNote
    @State var isPressing = false
    var isSelected: Bool
    var onSelect: () -> Void
    var onDelete: () -> Void

    var body: some View {
        ZStack(alignment: .topTrailing) {
            Text(note.text)
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding()
                .frame(maxWidth: .infinity, minHeight: 140)
                .background(note.color, in: .rect(cornerRadius: 12))

            if note.isFavorite {
                Image(systemName: "heart.fill")
                    .foregroundStyle(.red)
                    .padding(8)
                    .transition(.scale)
            }
        }
        .scaleEffect(isPressing ? 0.9 : 1)
        .opacity(isPressing ? 0.6 : 1)
        .animation(.easeIn, value: isPressing)
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(.blue, lineWidth: isSelected ? 4 : 0)
        }
        .shadow(radius: 2)
        .onLongPressGesture(minimumDuration: 1) {
            withAnimation {
                onDelete()
            }
        } onPressingChanged: { pressing in
            isPressing = pressing
        }
        .onTapGesture(count: 2) {
            withAnimation {
                note.isFavorite.toggle()
            }
        }
        .onTapGesture {
            onSelect()
        }
    }
}

#Preview {
    NoteCard(
        note: .constant(StickyNote.samples[0]),
        isSelected: true,
        onSelect: {},
        onDelete: {}
    )
    .padding()
}
