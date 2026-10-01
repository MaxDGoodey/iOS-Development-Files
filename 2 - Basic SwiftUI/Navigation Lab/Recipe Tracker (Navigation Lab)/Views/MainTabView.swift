//
//  MainTabView.swift
//  Recipe Tracker (Navigation Lab)
//
//  Created by Jane Madsen on 10/8/25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            MyRecipesScreen()
                .tabItem {
                    Label("My Recipes", systemImage: "list.dash")
                }
            DiscoverScreen()
                .tabItem {
                    Label("Discover Recipes", systemImage: "list.dash")
                }
        }
    }
}



#Preview {
    MainTabView()
}
