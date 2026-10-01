//
//  ContentView.swift
//  Form and controls lab
//
//  Created by Max Goodey on 10/1/26.
//

import SwiftUI

struct ContentView: View {
    let consultationDates = ["January 17", "May 7", "September 23", "October 27",    "December 30"]
    @State var name: String = ""
    @State var desiredLook: String = ""
    @State var selectedDate: String = "January 17"
    @State var numberOfOutfits: Int = 0
    @State var boldness: Double = 0
    @State var reminders: Bool = false
    @State var phonenumber: String = ""
    
    var body: some View {
        Form {
            Section {
                Text("Client Info")
                    .font(.title)
                TextField("Name", text: $name)
                TextField("Desired look", text: $desiredLook)
            }
            Section {
                Text("Appointment Info")
                    .font(.title)
                Picker("Appointment date", selection: $selectedDate) {
                    ForEach(consultationDates, id: \.self) {
                        date in Text(date)
                    }
                }
                Stepper("Should have \(numberOfOutfits) outfits.", value: $numberOfOutfits, in: 0...5)
                Text("Boldness level")
                Slider(value: $boldness, in: 0...1)
                Toggle("Reminders", isOn: $reminders)
                if reminders {
                    TextField("Phone number", text: $phonenumber)
                }
            }
            Section {
                Text("Summary")
                    .font(.title)
                Text("Name: \(name)")
                Text("Desired look: \(desiredLook)")
                Text("Appointment date: \(selectedDate)")
                Text("\(numberOfOutfits) outfits.")
                Text("Boldness value: \(boldness)")
                if reminders {
                    Text("Reminders are on")
                } else {
                    Text("Reminders are off")
                }
                if reminders {
                    Text("Phone number: \(phonenumber)")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
