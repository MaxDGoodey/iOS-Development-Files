//
//  TrailListScreen.swift
//  Trail Guide
//
//  This app works, but the same chains of modifiers are copied
//  all over it. Read the lab for tonight's steps.
//

import SwiftUI

struct TrailListScreen: View {
    let trails = Trail.sampleTrails

    var body: some View {
        NavigationStack {
            List(trails) { trail in
                NavigationLink {
                    TrailDetailScreen(trail: trail)
                } label: {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(trail.name)
                            .font(.headline)

                        Text("\(trail.miles.formatted()) mi · \(trail.elevationGain) ft gain")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)

                        HStack {
                            Text(trail.difficulty.rawValue)
                                .font(.caption)
                                .bold()
                                .foregroundStyle(.white)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 4)
                                .background(trail.difficulty.color)
                                .clipShape(.capsule)

                            if !trail.isOpen {
                                Text("Closed")
                                    .font(.caption)
                                    .bold()
                                    .foregroundStyle(.white)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 4)
                                    .background(.gray)
                                    .clipShape(.capsule)
                            }
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("Utah County Trails")
        }
    }
}

#Preview {
    TrailListScreen()
}
