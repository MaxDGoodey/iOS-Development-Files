//
//  FoodDriveScreen.swift
//  Food Drive
//
//  Every width on this screen is a fixed number. It looks fine on
//  some phones and wrong on others. Read the lab for tonight's steps.
//

// The geometry reader for the leaderboard. It can't be as easily replaced because it's measuring a percentage of the area taken up, rather than just the area its in.
// The two ForEach loops would be discarded.

import SwiftUI

struct ClassTotal {
    let room: String
    let cans: CGFloat
}

let classTotals = [
    ClassTotal(room: "Room 104", cans: 96),
    ClassTotal(room: "Room 210", cans: 72),
    ClassTotal(room: "Room 118", cans: 60),
    ClassTotal(room: "Room 305", cans: 31)
]

struct FoodDriveScreen: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var columnCount: Int {
        if horizontalSizeClass == .compact {
            return 2
        }
        return 3
    }
    
    var rowCount: Int {
        (volunteers.count + columnCount - 1) / columnCount
    }
    
    let cansCollected: CGFloat = 320
    let cansGoal: CGFloat = 500
    
    var progress: CGFloat {
        cansCollected / cansGoal
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                Text("MTECH Food Drive")
                    .font(.largeTitle)
                    .bold()
                
                // Progress bar
                VStack(alignment: .leading, spacing: 8) {
                    Text("\(Int(cansCollected)) of \(Int(cansGoal)) cans")
                        .font(.headline)
                    
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .fill(.gray.opacity(0.3))
                            .containerRelativeFrame(.horizontal)
                            .frame(height: 24)
                        
                        Rectangle()
                            .fill(.green)
                            .containerRelativeFrame(.horizontal) { length, _ in length * progress }
                            .frame(height: 24)
                    }
                    .clipShape(.capsule)
                }
                
                // Stat tiles
                HStack(spacing: 16) {
                    StatTile(title: "Days Left", value: "6")
                        .containerRelativeFrame(.horizontal, count: 2, spacing: 16)
                    
                    StatTile(title: "Classes Giving", value: "14")
                        .containerRelativeFrame(.horizontal, count: 2, spacing: 16)
                }
                
                // Drop-off banner
                ViewThatFits {
                    HStack {
                        Image(systemName: "shippingbox")
                        Text("Drop off cans at the front desk:")
                        Text("2301 West Ashton Blvd, Lehi, UT, 84048")
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Drop off cans at the front desk:")
                        Text("2301 West Ashton Blvd, Lehi, UT 84048")
                    }
                }
                .padding()
                .containerRelativeFrame(.horizontal, alignment: .leading)
                .background(.orange.opacity(0.2))
                .clipShape(.rect(cornerRadius: 12))
                
                ForEach(classTotals, id: \.room) { room in
                    HStack(spacing: 0) {
                        Text(room.room)
                            .frame(width: 120, alignment: .leading)
                        
                        GeometryReader { geometry in
                            Rectangle()
                                .fill(.blue)
                                .frame(width: geometry.size.width * (room.cans / classTotals.map { $0.cans }.max()!))
                        }
                        .frame(height: 20)
                    }
                }
                Text("Our Volunteers")
                    .font(.title2)
                    .fontWeight(.bold)
                
                VStack(spacing: 16) {
                    ForEach(0..<rowCount, id: \.self) { row in
                        HStack(alignment: .top, spacing: 16) {
                            ForEach(0..<columnCount, id: \.self) { column in
                                let index = row * columnCount + column
                                
                                if index < volunteers.count {
                                    
                                    let volunteer = volunteers[index]
                                    
                                    VolunteerCard(volunteer: volunteer)
                                        .containerRelativeFrame(.horizontal, count: columnCount, spacing: 16)
                                } else {
                                    Color.clear
                                        .containerRelativeFrame(.horizontal, count: columnCount, spacing: 16)
                                }
                            }
                        }
                        
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    FoodDriveScreen()
}
