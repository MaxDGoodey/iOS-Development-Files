import SwiftUI

struct SpaceshipScreen: View {
    // Step 1: Add the ship's shared values here as @State properties.
    @State var shipHeading: String = ""
    @State var availablePower: Int = 10
    
    var body: some View {
        Form {
            Section("Helm Station") {
                HelmStation(shipHeading: $shipHeading)
            }

            Section("Weapons Station") {
                WeaponsStation(availablePower: $availablePower)
            }

            Section("Shield Station") {
                ShieldStation(availablePower: $availablePower)
            }

            Section("Engine Station") {
                EngineStation(availablePower: $availablePower)
            }

            Section("Ship Status") {
                Text("Heading: \(shipHeading)")
                Text("Available Power: \(availablePower)")
            }
            
        }
    }
}

struct HelmStation: View {
    @Binding var shipHeading: String
    @State var inChair = false
    
    var body: some View {
        HStack {
            CrewChair(crewIcon: "dog", inChair: $inChair)

            TextField("Heading", text: $shipHeading)
                .disabled(!inChair)
        }
    }
}

struct WeaponsStation: View {
    @Binding var availablePower: Int
    @State var weaponsOnline = false
    @State var inChair = false
    
    var body: some View {
        HStack {
            CrewChair(crewIcon: "cat", inChair: $inChair)

            VStack {
                if weaponsOnline {
                    Text("Weapons: ONLINE")
                } else {
                    Text("Weapons: OFFLINE")
                }

                Button("Power Weapons Up/Down") {
                    if weaponsOnline {
                        availablePower += 3
                        weaponsOnline.toggle()
                    } else {
                        availablePower -= 3
                        weaponsOnline.toggle()
                    }
                }

                Button("Fire!") {
                    print("PEW!")
                }
                .disabled(!weaponsOnline)
            }
            .buttonStyle(.borderless)
            .disabled(!inChair)
        }
    }
}

struct ShieldStation: View {
    @Binding var availablePower: Int
    @State var shieldPower = 0
    @State var inChair = false
    
    var body: some View {
        HStack {
            CrewChair(crewIcon: "lizard", inChair: $inChair)

            Stepper("Shield Power: \(shieldPower)", onIncrement: {
                if availablePower > 0 {
                    availablePower -= 1
                    shieldPower += 1
                }
            }, onDecrement: {
                if shieldPower > 0 {
                    shieldPower -= 1
                    availablePower += 1
                }
            })
            .disabled(!inChair)
        }
    }
}

struct EngineStation: View {
    @Binding var availablePower: Int
    @State var enginePower = 0
    @State var inChair = false
    
    var body: some View {
        HStack {
            CrewChair(crewIcon: "hare", inChair: $inChair)

            Stepper("Engine Power: \(enginePower)", onIncrement: {
                if availablePower > 0 {
                    availablePower -= 1
                    enginePower += 1
                }
            }, onDecrement: {
                if enginePower > 0 {
                    enginePower -= 1
                    availablePower += 1
                }
            })
            .disabled(!inChair)
        }
    }
}

struct CrewChair: View {
    var crewIcon: String
    @Binding var inChair: Bool

    var body: some View {
        Button {
            inChair.toggle()
        } label: {
            if inChair {
                Image(systemName: crewIcon)
            } else {
                Image(systemName: "person.slash")
            }
        }
        .buttonStyle(.borderless)
        .padding(5)
        .background {
            Circle()
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    SpaceshipScreen()
}
