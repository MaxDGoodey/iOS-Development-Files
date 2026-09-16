import SwiftUI
import Playgrounds

struct Game: Identifiable {
    var title: String
    var genre: String
    var installed: Bool
    var id = UUID()
}

struct ContentView: View {
    @State var games = [Game(title: "Outer wilds", genre: "Puzzle", installed: true), Game(title: "Minecraft", genre: "Sandbox", installed: true), Game(title: "Skyrim", genre: "RPG", installed: false), Game(title: "The Binding Of Isaac", genre: "Roguelite", installed: true), Game(title: "Portal 2", genre: "Puzzle", installed: false), Game(title: "Fortnite", genre: "FPS", installed: false), Game(title: "Deltarune", genre: "RPG", installed: false), Game(title: "Links Awakening", genre: "Action-Adventure", installed: true)]
    @State var filterSelection = "All"
    let filterOptions = ["All", "Installed", "Uninstalled"]
    
    var filteredOptions: [Game] {
        if filterSelection == "Installed" {
            return games.filter { $0.installed }
        } else if filterSelection == "Uninstalled" {
            return games.filter { !$0.installed }
        } else {
            return games
        }
    }
    
    var body: some View {
        Picker("Filter", selection: $filterSelection) {
            ForEach(filterOptions, id: \.self) { filterOption in
                Text(filterOption).tag(filterOption)
            }
        }
        .pickerStyle(.segmented)
        
        List {
            ForEach(filteredOptions) {option in if option.installed {
                Text("Title: \(option.title), Genre: \(option.genre), Installed.")
            } else {
                Text("Title: \(option.title), Genre: \(option.genre), Not Installed.")
            }
            }
        }
    }
}

#Preview {
    ContentView()
}
