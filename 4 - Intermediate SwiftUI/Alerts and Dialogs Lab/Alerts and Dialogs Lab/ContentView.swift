//
//  ContentView.swift
//  Alerts and Dialogs Lab
//
//  Created by Max Goodey on 11/12/26.
//

import SwiftUI

struct ContentView: View {
    @State var numbers = 10
    @State var textField = "hi"
    @State var newText = ""
    @State var errorMessage = ""
    @State var selectedSong: String?
    @State var value1 = "not selected"
    @State var value2 = "not selected"
    @State var value3 = "not selected"
    var songs = ["song1", "song2", "song3"]
    @State var isShowingAlertWithError = false
    @State var isShowingAlertWithRoles = false
    @State var isShowingAlertWithTField = false
    @State var isShowingAlertWithData = false
    @State var isShowingConfirmationDialog = false
    @State var isShowingDialogWithChoices = false
    
    enum Error: LocalizedError {
        case error1
        case error2
        
        var errorDescription: String? {
            switch self {
            case .error1:
                return String(localized: "test error message")
            case .error2:
                return String(localized: "text error message 2")
            }
        }
    }
    
    func errorTest() throws {
        let number = 0
        if number == 0 {
            let random = Int.random(in: 1...2)
            if random == 1 {
                throw Error.error1
            } else {
                throw Error.error2
            }
        }
    }
    
    func runTest() {
        do {
            try errorTest()
        } catch {
            errorMessage = error.localizedDescription
            isShowingAlertWithError = true
        }
    }
    
    var body: some View {
        Button("Alert with Roles") {
            isShowingAlertWithRoles = true
        }
        .alert("Alert With Roles", isPresented: $isShowingAlertWithRoles) {
            Button("Destructive", role: .destructive) {
                numbers -= 1
            }
            Button("Cancel", role: .cancel) {
            }
        }
        Text(String(numbers))
        Button("Alert with Text Field") {
            isShowingAlertWithTField = true
        }
        .alert("Alert with Text Field", isPresented: $isShowingAlertWithTField) {
            TextField("Text", text: $newText)
            Button("Cancel", role: .cancel) {}
            Button("Save") {
                textField = newText
            }
        }
        Text(textField)
        Button("Error Alert") {
            runTest()
        }
        .alert("Error Alert", isPresented: $isShowingAlertWithError) {
            Text(errorMessage)
        }
        ForEach(songs, id: \.self) { song in
            Button(song) {
                selectedSong = song
                isShowingAlertWithData = true
            }
            .alert("Alert With Data", isPresented: $isShowingAlertWithData, presenting: selectedSong) { song in
                Button("OK") {}
            } message: { song in
                Text(song)
            }
        }
        Button("Confirmation Dialog") {
            isShowingConfirmationDialog = true
        }
        .confirmationDialog("Confirmation Dialog", isPresented: $isShowingConfirmationDialog, titleVisibility: .visible) {
            Button("Cancel", role: .cancel) {}
            Button("Delete", role: .destructive) {}
        }  message: {
            Text("Are you sure?")
        }
        Button("Dialog With Choices") {
            isShowingDialogWithChoices = true
        }
        .confirmationDialog("Dialog With Choices", isPresented: $isShowingDialogWithChoices) {
            Button("Change 1") {
                value1 = "selected"
                value2 = "not selected"
                value3 = "not selected"
            }
            Button("Change 2") {
                value1 = "not selected"
                value2 = "selected"
                value3 = "not selected"
            }
            Button("Change 3") {
                value1 = "not selected"
                value2 = "not selected"
                value3 = "selected"
            }
        }
        Text(value1)
        Text(value2)
        Text(value3)
    }
}

#Preview {
    ContentView()
}
