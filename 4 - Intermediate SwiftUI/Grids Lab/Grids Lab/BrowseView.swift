//
//  BrowseView.swift
//  Grids Lab
//
//  Created by Max Goodey on 11/4/26.
//

import SwiftUI

struct BrowseView: View {
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                HatsRowView()
                    .id(1)
                ShirtsRowView()
                PantsRowView()
                Button("Scroll to Top") {
                    scrollTo(1, proxy: proxy)
                }
                .buttonStyle(.glassProminent)
            }
            .padding()
        }
        
    }
}

struct ItemView: View {
    var item: Clothing
    var length: Double
    
    var body: some View {
        VStack {
            Text(item.name)
            Text(String(format: "%.2f", item.price))
            Text(item.size)
            Text(item.color)
        }
        .frame(width: length, height: length)
        .background(.gray.opacity(0.12))
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

struct HatsRowView: View {
    var body: some View {
        Section(header: Text("Hats").font(.title)) {
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(hats, id: \.self) {hat in
                        ItemView(item: hat, length: 130)
                    }
                }
                .scrollTargetLayout()
                .padding()
            }
            .scrollTargetBehavior(.viewAligned)
        }
    }
}

struct ShirtsRowView: View {
    var shirtsLayout = [
        GridItem(.fixed(130)),
        GridItem(.fixed(130))
    ]
    
    var body: some View {
        Section(header: Text("Shirts").font(.title)) {
            ScrollView(.horizontal) {
                LazyHGrid(rows: shirtsLayout) {
                    ForEach(shirts, id: \.self) { shirt in
                        ItemView(item: shirt, length: 130)
                    }
                }
                .padding()
            }
        }
    }
}

struct PantsRowView: View {
    var pantsLayout = [
        GridItem(.adaptive(minimum: 130)),
        GridItem(.adaptive(minimum: 130)),
        GridItem(.adaptive(minimum: 130)),
        GridItem(.adaptive(minimum: 130))
    ]
    
    var body: some View {
        Section(header: Text("Pants").font(.title)) {
            ScrollView(.horizontal) {
                LazyHGrid(rows: pantsLayout) {
                    ForEach(shirts, id: \.self) { shirt in
                        ItemView(item: shirt, length: 130)
                    }
                }
                .padding()
            }
            .scrollTargetBehavior(.paging)
        }
    }
}

#Preview {
    BrowseView()
}
