import SwiftUI
import Playgrounds

struct ContentView: View {
    @State private var isButtonDisabled = false
    @State private var isButtonDisabled2 = false
    @State private var counter: Double = 0
    @State private var hiddenRectangle: Double = 0
    var body: some View {
        
        Button("Disable this button") {
            isButtonDisabled = true
        }
        .disabled(isButtonDisabled)
        
        Button("Reenable that button and disable this one") {
            isButtonDisabled = false
            isButtonDisabled2 = true
        }
        .disabled(isButtonDisabled2)
        
        Button("Reenable that button and add one to the counter") {
            isButtonDisabled2 = false
            counter += 1
        }
        
        Text(String(counter))
        
        Button("Remove one from that counter") {
            counter -= 1
        }
        
        Button("Multiply that counter by 5") {
            counter *= 5
        }
        
        Button("Divide that counter by 3") {
            counter /= 3
        }
        
        Button("Make a rectangle") {
            hiddenRectangle = 1
        }
        
        Button("Remove a rectangle") {
            hiddenRectangle = 0
        }
        
        Rectangle()
            .opacity(hiddenRectangle)
        
        Button {
            counter += 2
        } label: {
            Image("isaac")
        }
        
        Button("Crash the app") {
            fatalError("Goodbye")
        }
    }
}

#Preview {
    ContentView()
}
