import SwiftUI

@Observable class ShipComputer {
    var shipHeading: String = ""
    var availablePower: Int = 10
}

struct SpaceshipScreen: View {
    // Step 1: Add the ship's shared values here as @State properties.
    @State var computer = ShipComputer()
    
    var body: some View {
        Form {
            Section("Helm Station") {
                HelmStation(computer: computer)
            }

            Section("Weapons Station") {
                WeaponsStation(computer: computer)
            }

            Section("Shield Station") {
                ShieldStation(computer: computer)
            }

            Section("Engine Station") {
                EngineStation(computer: computer)
            }

            Section("Ship Status") {
                Text("Heading: \(computer.shipHeading)")
                Text("Available Power: \(computer.availablePower)")
            }
            
        }
    }
}

struct HelmStation: View {
    @Bindable var computer: ShipComputer
    @State var inChair = false
    
    var body: some View {
        HStack {
            CrewChair(crewIcon: "dog", inChair: $inChair)

            TextField("Heading", text: $computer.shipHeading)
                .disabled(!inChair)
        }
    }
}

struct WeaponsStation: View {
    var computer: ShipComputer
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
                        computer.availablePower += 3
                        weaponsOnline.toggle()
                    } else {
                        computer.availablePower -= 3
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
    var computer: ShipComputer
    @State var shieldPower = 0
    @State var inChair = false
    
    var body: some View {
        HStack {
            CrewChair(crewIcon: "lizard", inChair: $inChair)

            Stepper("Shield Power: \(shieldPower)", onIncrement: {
                if computer.availablePower > 0 {
                    computer.availablePower -= 1
                    shieldPower += 1
                }
            }, onDecrement: {
                if shieldPower > 0 {
                    shieldPower -= 1
                    computer.availablePower += 1
                }
            })
            .disabled(!inChair)
        }
    }
}

struct EngineStation: View {
    var computer: ShipComputer
    @State var enginePower = 0
    @State var inChair = false
    
    var body: some View {
        HStack {
            CrewChair(crewIcon: "hare", inChair: $inChair)

            Stepper("Engine Power: \(enginePower)", onIncrement: {
                if computer.availablePower > 0 {
                    computer.availablePower -= 1
                    enginePower += 1
                }
            }, onDecrement: {
                if enginePower > 0 {
                    enginePower -= 1
                    computer.availablePower += 1
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

// Removing @Observable means you cant use @Bindable meaning the code doesn't compile. If the compiler didnt catch this, then removing @Observable would mean the values would be changing, but none of the views would be updated, meaning it would look like it isnt changing the values.
// HelmStation doesn't own computer, meaning you shouldn't mark it @State. In this case, marking it @State doesn't change how the code looks, but it can take up extra memory due to the computer setting aside memory for that variable.
// HelmStation binds with $, and the power stations don't, meaning they don't need @Bindable
// Only the ShieldStation view needs to read shieldPower, so it shouldn't be in ShipComputer because that would break the Interface Segregation rule in SOLID.
// Something that got easier was how the views were initialized, and now the power stations are able to change the heading even though they shouldn't need to (to match SOLID wouldn't you seperate the ShipComputer class into a power class and a heading class so that the power stations cant read the heading?)
