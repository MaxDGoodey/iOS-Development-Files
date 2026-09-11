import SwiftUI

struct AboutTheDeveloper: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.green)
                .ignoresSafeArea()
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.thinMaterial)
                        .frame(width: 350, height: 100)
                    Text("About the developer")
                        .font(.largeTitle)
                        .bold()
                }
                VStack(alignment: .leading, spacing: 10) {
                    Text("Name:")
                        .font(.largeTitle)
                        .bold()
                    Text("Max")
                        .font(.title)
                        .bold()
                    Text("About Me:")
                        .font(.largeTitle)
                        .bold()
                    Text("I am 17 years old. I go to orem high, and I play a lot of piano. I love video games, and the objectively best video game is Outer Wilds")
                        .foregroundStyle(.red)
                    Text("Fun Facts:")
                        .font(.largeTitle)
                        .bold()
                    Text("I have 3 pets, I can play clair de lune on the piano, and I have 7 siblings.")
                }
            }
        }
    }
}
