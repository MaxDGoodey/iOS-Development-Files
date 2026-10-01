//
//  PetsScreen.swift
//  Pet Sitter (Images Lab)
//

import SwiftUI

struct PetsScreen: View {
    var body: some View {
        // The page already scrolls. You don't need to change
        // the ScrollView or the VStack.
        ScrollView {
            VStack(spacing: 24) {
                // Step 1: replace this with the header.
                ZStack {
                    Image("pet1")
                        .resizable()
                        .frame(width: 350, height: 220)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    Text("This Week's Pets")
                }

                // Step 2: replace this with the row of pets.
                HStack {
                    Image("pet1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 90, height: 90)
                        .clipShape(Circle())
                        .overlay(
                            Circle().stroke(.black, lineWidth: 3)
                        )
                    Image("pet2")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 90, height: 90)
                        .clipShape(Circle())
                        .overlay(
                            Circle().stroke(.black, lineWidth: 3)
                        )
                    Image("pet3")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 90, height: 90)
                        .clipShape(Circle())
                        .overlay(
                            Circle().stroke(.black, lineWidth: 3)
                        )
                }

                // Step 3: replace this with the care icons.
                HStack {
                    VStack {
                        Image(systemName: "fork.knife")
                            .font(.title)
                        Text("Fed twice a day")
                    }
                    VStack {
                        Image(systemName: "figure.walk")
                            .font(.title)
                            .foregroundStyle(.green)
                        Text("Two walks")
                    }
                    VStack {
                        Image(systemName: "drop.fill")
                            .font(.title)
                            .foregroundStyle(.blue)
                        Text("Fresh water")
                    }
                }

                // Step 4: replace this with the full photo.
                Image("pet2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350, height: 300)
            }
            .padding()
        }
    }
}

#Preview {
    PetsScreen()
}
