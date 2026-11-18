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
    @State var countdownStep = 4
    @State var isPulsing = false
    
    var body: some View {
        ZStack {
            switch countdownStep {
            case 3:
                Text("3")
                    .transition(.asymmetric(insertion: .opacity.combined(with: .scale(scale: 3)), removal: .opacity))
            case 2:
                Text("2")
                    .transition(.asymmetric(insertion: .opacity.combined(with: .scale(scale: 3)), removal: .opacity))
            case 1:
                Text("1")
                    .transition(.asymmetric(insertion: .opacity.combined(with: .scale(scale: 3)), removal: .opacity))
            case 0:
                Text("GO!")
                    .transition(.scale(scale: 0.2).combined(with: .opacity))
            default:
                Text("")
            }
        }
        
        Text("Countdown")
            .font(.title)
            .scaleEffect(gameStarted ? 3 : 1)
            .padding()
        
        Image(systemName: "gamecontroller.fill")
            .rotationEffect(.degrees(gameStarted ? 360 : 0))
        
        Button("Start Game") {
            withAnimation(.easeInOut(duration: 0.8)) {
                gameStarted = true
                countdownStep = 3
            }
            withAnimation(.easeInOut(duration: 0.8).delay(1)) {
                countdownStep = 2
            }
            withAnimation(.easeInOut(duration: 0.8).delay(2)) {
                countdownStep = 1
            }
            withAnimation(.bouncy(extraBounce: 0.2).delay(3)) {
                countdownStep = 0
            }
        }
        .scaleEffect(isPulsing ? 1.1 : 1)
        .onAppear {
            withAnimation(.easeOut(duration: 0.3).repeatForever(autoreverses: true)) {
                isPulsing = true
            }
        }
        .opacity(gameStarted ? 0 : 1)
        
        Button("Back") {
            gameStarted = false
            countdownStep = 4
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
