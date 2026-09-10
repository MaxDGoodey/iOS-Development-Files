import SwiftUI

struct AboutTheDeveloper: View {
    var body: some View {
        Text("About the developer")
            .font(.largeTitle)
            .padding()
            .bold()
        Text("Max")
            .font(.title)
            .bold()
        Text("I am 17 years old. I go to orem high, and I play a lot of piano. I love video games, and the objectively best video game is Outer Wilds")
            .padding()
            .foregroundStyle(.red)
        Text("Fun Facts")
            .font(.headline)
            .bold()
        Text("I have 3 pets. I can play clair de lune on the piano. I just beat the adventure of link.")
            .padding()
    }
}
