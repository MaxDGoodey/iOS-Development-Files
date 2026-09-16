import SwiftUI

struct Park: Hashable {
    var name: String
    var yearFounded: Int
    var size: Int
    var closestTown: String
    var yearsAlive: Int {
        2026 - yearFounded
    }
}

struct ContentView: View {
    let park1 = Park(name: "Zion", yearFounded: 1919, size: 147000, closestTown: "Springdale")
    let park2 = Park(name: "Bryce Canyon", yearFounded: 1928, size: 36000, closestTown: "Bryce Canyon City")
    let park3 = Park(name: "Arches", yearFounded: 1971, size: 77000, closestTown: "Moab")
    let park4 = Park(name: "Capitol Reef", yearFounded: 1971, size: 242000, closestTown: "Torrey")
    
    @State var selectedPark: Park = Park(name: "Zion", yearFounded: 1919, size: 147000, closestTown: "Springdale")
    
    var body: some View {
        VStack {
            Picker("Park", selection: $selectedPark) {
                Text("Zion").tag(park1)
                Text("Bryce Canyon").tag(park2)
                Text("Arches").tag(park3)
                Text("Capitol Reef").tag(park4)
            }
            .pickerStyle(.segmented)
            
            Text("Year Founded: \(selectedPark.yearFounded)")
            Text("Acres: \(selectedPark.size)")
            Text("Closest Town: \(selectedPark.closestTown)")
            Text("Years since founded: \(selectedPark.yearsAlive)")
        }
    }
}

#Preview {
    ContentView()
}
