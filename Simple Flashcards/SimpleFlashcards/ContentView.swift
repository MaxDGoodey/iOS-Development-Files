//
//  ContentView.swift
//  SimpleFlashcards
//
//  Created by Jane Madsen on 12/10/24.
//

// Refer to the file called VocabularyList for instructions for this assignment.
// Feel free to play around with the SwiftUI code below, but make sure not to break anything without undoing your changes!

import SwiftUI

struct ContentView: View {
    // Properties of ContentView to hold which word should be displayed, the list of vocabulary, and which side of the card is showing
    @State var displayedWordIndex = 0
    @State var vocabulary: [Vocab] = Vocab.list
    @State var definitionDisplayed = false
    
    var vocab: Vocab {
        vocabulary[displayedWordIndex]
    }

    var body: some View {
        VStack {
            VStack {
                Spacer()
                
                // Shows either the word or the definition, depending on defintionDisplayed's value.
                // Has several modifiers to style the Text.
                Text(definitionDisplayed ? vocab.definition : vocab.word)
                    .font(.title)
                    .padding()
                    .background {
                        RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                            .fill(.cyan)
                    }
                
                // Adds pictures, synonyms, and notes in a scrolling view if the definition is displayed and the vocabulary has them.
                if definitionDisplayed {
                    ScrollView {
                        VStack {
                            if !vocab.referenceImage.isEmpty {
                                Image(vocab.referenceImage)
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                                    .shadow(radius: 7)
                                    .padding()
                            }
                            if !vocab.synonyms.isEmpty {
                                // Synonyms Section
                                Text("Synonyms")
                                    .font(.headline)
                                    .padding(.top)
                                
                                ForEach(vocab.synonyms, id: \.self) { synonym in
                                    Text(synonym)
                                        .padding()
                                        .onTapGesture {
                                            definitionDisplayed.toggle()
                                        }
                                        .background {
                                            RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                                                .fill(.gray)
                                        }
                                }
                            }
                            
                            if !vocab.notes.isEmpty {
                                // Notes Section
                                Text("Notes")
                                    .font(.headline)
                                    .padding(.top)
                                
                                ForEach(vocab.notes, id: \.self) { note in
                                    Text(note)
                                        .padding()
                                        .onTapGesture {
                                            definitionDisplayed.toggle()
                                        }
                                        .background {
                                            RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                                                .fill(.gray)
                                        }
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                
                Spacer()
            }
            .padding()
            .background(.white)
            .onTapGesture {
                // "Flips the card" if any of the UI above here is tapped.
                definitionDisplayed.toggle()
            }

            // Shows the previous, shuffle, and next buttons.
            HStack {
                Spacer()
                
                Button("Previous") {
                    definitionDisplayed = false
                    if displayedWordIndex > 0 {
                        displayedWordIndex -= 1
                    }
                }
                .disabled(displayedWordIndex <= 0)
                
                Spacer()
                
                Button("Shuffle") {
                    definitionDisplayed = false
                    displayedWordIndex = 0
                    vocabulary.shuffle()
                }
                
                Spacer()
                
                Button("Next") {
                    if displayedWordIndex < vocabulary.count - 1 {
                        definitionDisplayed = false
                        displayedWordIndex += 1
                    }
                }
                .disabled(displayedWordIndex >= vocabulary.count - 1)
                
                Spacer()
            }
            .padding()
            .background(.thinMaterial)
        }
        
    }
}


#Preview {
    ContentView()
}
