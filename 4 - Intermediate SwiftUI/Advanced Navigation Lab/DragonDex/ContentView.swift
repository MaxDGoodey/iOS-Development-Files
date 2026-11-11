//
//  ContentView.swift
//  DragonDex
//
//  Created by Max Goodey on 11/6/26.
//

import SwiftUI

struct MainTabView: View {
    @State private var mainRouter = MainRouter()
    
    var body: some View {
        TabView(selection: $mainRouter.selectedTab) {
            Tab("Dragons", systemImage: "", value: .dragons) {
                DragonListScreen()
                    .environment(mainRouter)
            }
            Tab("Riders", systemImage: "", value: .riders) {
                RidersScreen()
                    .environment(mainRouter)
            }
        }
        .sheet(isPresented: $mainRouter.isShowingSettings) {
            SettingsScreen(isShowingSettings: $mainRouter.isShowingSettings)
        }
    }
}

struct SettingsScreen: View {
    @Binding var isShowingSettings: Bool
    
    var body: some View {
        Text("Settings")
        Button("Done") {
            isShowingSettings = false
        }
    }
}

struct RidersScreen: View {
    @Environment(MainRouter.self) var mainRouter
    
    var body: some View {
        List {
            ForEach(riders, id: \.self) {
                rider in
                HStack {
                    Text("\(rider.name), Dragon: \(rider.dragonName)")
                    Button("Find Dragon") {
                        mainRouter.selectedTab = .dragons
                    }
                }
            }
        }
    }
}


struct DragonListScreen: View {
    @State private var dragonsRouter = DragonsRouter()
    @Environment(MainRouter.self) var mainRouter
    
    var body: some View {
        NavigationStack(path: $dragonsRouter.navigationPath) {
            List(dragons, id: \.self) { dragon in
                Button(dragon.name) {
                    dragonsRouter.navigateTo(route: .dragon(dragon))
                }
            }
            .toolbar() {
                Button("Random Dragon") {
                    dragonsRouter.navigateTo(route: .dragon(dragons.randomElement()!))
                }
                
                Button {
                    mainRouter.isShowingSettings = true
                } label: {
                    Image(systemName: "gear")
                }
                
            }
            .navigationTitle("Dragons")
            .navigationDestination(for: DragonsRouter.Route.self) {
                route in
                dragonsRouter.view(for: route)
            }
            
        }
        .environment(dragonsRouter)
    }
}

struct DragonDetailScreen: View {
    @Environment(DragonsRouter.self) var dragonsRouter
    let dragon: Dragon
    
    var body: some View {
        Text(dragon.name)
        Text(dragon.species)
        Text(String(dragon.fireRating))
        Text(dragon.lore)
        ForEach(dragon.powers, id: \.self) { power in
            Button(power.name) {
                dragonsRouter.navigateTo(route: .power(power))
            }
        }
        .navigationDestination(for: DragonsRouter.Route.self) { route in
            dragonsRouter.view(for: route)
        }
    }
}

struct PowerDetailScreen: View {
    @Environment(DragonsRouter.self) var dragonsRouter
    
    let power: Power
    
    var body: some View {
        Text(power.name)
        Text(power.description)
        Button("Back to Dragons") {
            dragonsRouter.goHome()
        }
    }
}


#Preview {
    MainTabView()
}
