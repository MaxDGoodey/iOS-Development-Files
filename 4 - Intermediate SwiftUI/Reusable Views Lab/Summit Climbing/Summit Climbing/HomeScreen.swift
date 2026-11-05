//
//  HomeScreen.swift
//  Summit Climbing
//
//  This screen works, but the same cards and rows are copied
//  over and over. Read the lab for tonight's steps.
//

import SwiftUI

struct HomeScreen: View {
    @State private var statusMessage = "Welcome back!"

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    Text(statusMessage)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)

                    // Card: Today's Hours
                    GymCard(title: "Today's Hours", systemImage: "clock") {
                        Text("Open 6:00 AM to 10:00 PM")

                        Text("Kids' climb: 4:00 PM to 6:00 PM")
                            .foregroundStyle(.secondary)
                    }

                    // Card: Your Membership
                    GymCard(title: "Your Membership") {
                        Text("Monthly Pass")
                            .font(.title3)
                            .bold()
                        
                        Text("Renews Dec 1")
                        
                        Text("12 visits this month")
                            .foregroundStyle(.secondary)
                    }

                    // Card: Quick Actions
                    GymCard(title: "Quick Actions", systemImage: "bolt") {
                        ActionRow(title: "Check In", systemImage: "checkmark.circle", action: {statusMessage = "You're checked in. Have a good climb!"})
                        
                        ActionRow(title: "Book a Class", systemImage: "calendar", action: {statusMessage = "Your spot in Intro to Bouldering is saved."})
                        
                        ActionRow(title: "Rent Gear", action: {statusMessage = "Shoes and a harness are waiting at the front desk."})
                    }
                }
                .padding()
            }
            .navigationTitle("Summit Climbing")
        }
    }
}

#Preview {
    HomeScreen()
}
