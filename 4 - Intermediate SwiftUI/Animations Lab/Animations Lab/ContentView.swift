//
//  ContentView.swift
//  Animations Lab
//
//  Created by Max Goodey on 11/13/26.
//

import SwiftUI

struct ContentView: View {
    @State var gameStarted = false
    @State var isMuted = false
    
    var body: some View {
        Text("Countdown")
            .font(.title)
            .scaleEffect(gameStarted ? 3 : 1)
            .padding()
        
        Image(systemName: "gamecontroller.fill")
            .rotationEffect(.degrees(gameStarted ? 360 : 0))
        
        Button("Start Game") {
            withAnimation {
                gameStarted = true
            }
        }
        .opacity(gameStarted ? 0 : 1)
        
        Button("Back") {
            gameStarted = false
        }
        .foregroundStyle(gameStarted ? .red : .gray)
        
        Image(systemName: "speaker.wave.2.fill")
            .opacity(isMuted ? 0.3 : 1)
            .scaleEffect(isMuted ? 0.8 : 1)
            .animation(.easeIn, value: isMuted)
        
        Button("Sound") {
            isMuted.toggle()
        }
    }
}

#Preview {
    ContentView()
}
