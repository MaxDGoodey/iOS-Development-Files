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
                OrderSummaryView()
                Button("Scroll to Top") {
                    scrollTo(1, proxy: proxy)
                }
                .buttonStyle(.glassProminent)
            }
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

struct OrderItemView: View {
    var item: Clothing
    
    var body: some View {
        GridRow {
            Text(item.name)
            Text(item.size)
            Text(String(format: "%.2f", item.price))
        }
    }
}

struct OrderSummaryView: View {
    var listOfOrders: [Clothing] = [hats.first!, shirts.first!, pants.first!]
    
    var totalPrice: String {
        var total: Double = 0
        
        for index in (0..<listOfOrders.count) {
            total += listOfOrders[index].price
        }
        
        return String(total)
    }
    
    var body: some View {
        Section {
            Grid {
                GridRow {
                    Text("Item")
                    Text("Size")
                    Text("Price")
                        .gridColumnAlignment(.trailing)
                }
                Divider()
                ForEach(listOfOrders, id: \.self) { item in
                    OrderItemView(item: item)
                }
                Divider()
                GridRow {
                    Text("Total")
                        .gridCellColumns(2)
                    Text(String(totalPrice))
                }
            }
        }
        .padding()
    }
}

struct HatsRowView: View {
    var body: some View {
        Section {
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
        } header: {
            Text("Hats")
                .font(.title)
        }
    }
}

struct ShirtsRowView: View {
    var shirtsLayout = [
        GridItem(.fixed(130)),
        GridItem(.fixed(130))
    ]
    
    var body: some View {
        Section {
            ScrollView(.horizontal) {
                LazyHGrid(rows: shirtsLayout) {
                    ForEach(shirts, id: \.self) { shirt in
                        ItemView(item: shirt, length: 130)
                    }
                }
                .padding()
            }
        } header: {
            Text("Shirts")
                .font(.title)
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
        Section {
            ScrollView(.horizontal) {
                LazyHGrid(rows: pantsLayout) {
                    ForEach(shirts, id: \.self) { shirt in
                        ItemView(item: shirt, length: 130)
                    }
                }
                .padding()
            }
            .scrollTargetBehavior(.paging)
        } header: {
            Text("Pants")
                .font(.title)
        }
    }
}

#Preview {
    BrowseView()
}
