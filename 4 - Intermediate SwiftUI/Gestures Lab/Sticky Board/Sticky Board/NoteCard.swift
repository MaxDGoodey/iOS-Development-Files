//
//  NoteCard.swift
//  Sticky Board
//

import SwiftUI

struct NoteCard: View {
    @Binding var note: StickyNote
    @State var isPressing = false
    @GestureState var dragOffset = CGSize.zero
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
        .animation(.bouncy, value: dragOffset)
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(.blue, lineWidth: isSelected ? 4 : 0)
        }
        .shadow(radius: 2)
        .offset(x: note.offset.width + dragOffset.width, y: note.offset.height + dragOffset.height)
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
        .gesture(
            DragGesture()
                .updating($dragOffset) { value, state, _ in
                    state = value.translation
                }
                .onEnded { value in
                    if value.translation.height >= 300 {
                        withAnimation {
                            onDelete()
                        }
                    } else if value.translation.height >= -300 {
                        note.offset.width += value.translation.width
                        note.offset.height += value.translation.height
                    }
                }
        )
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
