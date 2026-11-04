import SwiftUI

struct ContentView: View {
    var body: some View {
        Button("Hello") {
            
        }
        .buttonStyle(.chunky(color: .green))
        
        Button {
            
        } label: {
            Image(systemName: "plus")
        }
        .buttonStyle(.circleIcon())
        
        Button("Hello 2") {
            
        }
        .buttonStyle(.chip(isSelected: false))
    }
}

#Preview {
    ContentView()
}
