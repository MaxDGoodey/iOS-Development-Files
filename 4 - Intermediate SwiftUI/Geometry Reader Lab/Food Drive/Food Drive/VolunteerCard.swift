//
//  VolunteerCard.swift
//  Food Drive
//
//  Created by Max Goodey on 11/6/26.
//

import SwiftUI

struct VolunteerCard: View {
    let volunteer: Volunteer
    
    var body: some View {
        VStack {
            Image(systemName: volunteer.systemImage)
                .font(.largeTitle)
            Text(volunteer.name)
                .font(.headline)
            Text(volunteer.description)
                .font(.caption)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.green.opacity(0.15))
        .clipShape(.rect(cornerRadius: 12))
    }
}
