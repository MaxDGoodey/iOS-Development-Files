//
//  ContentView.swift
//  DragonDex
//
//  Created by Max Goodey on 11/6/26.
//

import SwiftUI


struct DragonListScreen: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            List(dragons, id: \.self) { dragon in
                NavigationLink(dragon.name, value: dragon)
                
            }
            .toolbar() {
                Button("Random Dragon") {
                    path.append(dragons.randomElement()!)
                }
                
            }
            .navigationTitle("Dragons")
            .navigationDestination(for: Dragon.self) { dragon in
                DragonDetailScreen(path: $path, dragon: dragon)
            }

        }
    }
}

struct DragonDetailScreen: View {
    @Binding var path: NavigationPath
    let dragon: Dragon
    
    var body: some View {
        Text(dragon.name)
        Text(dragon.species)
        Text(String(dragon.fireRating))
        Text(dragon.lore)
        ForEach(dragon.powers, id: \.self) { power in
            NavigationLink(power.name, value: power)
        }
        .navigationDestination(for: Power.self) { power in
            PowerDetailScreen(path: $path, power: power)
        }
    }
}

struct PowerDetailScreen: View {
    @Binding var path: NavigationPath
    
    let power: Power
    
    var body: some View {
        Text(power.name)
        Text(power.description)
        Button("Back to Dragons") {
            path = NavigationPath()
        }
    }
}


#Preview {
    DragonListScreen()
}
