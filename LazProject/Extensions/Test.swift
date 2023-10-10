//
//  Test.swift
//  LazProject
//
//  Created by Putut Yusri Bahtiar on 26/09/23.
//

import SwiftUI

import SwiftUI

struct Item: Hashable {
    let id = UUID()
    let name: String
    let price: String
    // Add any other properties you want to display in the detail view
}

struct Test: View {
    
    let gridItems = [
        GridItem(.flexible(minimum: 100, maximum: 210)),
        GridItem(.flexible(minimum: 100, maximum: 210)),
    ]
    
    let items: [Item] = {
        var items = [Item]()
        for index in 0..<200 {
            items.append(Item(name: "Nike Sportswear Club Fleece", price: "$99"))
        }
        return items
    }()
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                LazyVStack {
                    LazyVGrid(columns: gridItems) {
                        ForEach(items, id: \.self) { item in
                            NavigationLink(destination: DetailView(item: item)) {
                                ItemView(item: item)
                            }
                        }
                    }
                }
                .navigationTitle("Items")
            }
        }
    }
}

struct ItemView: View {
    let item: Item
    
    var body: some View {
        VStack {
            Text("Item")
                .frame(width: 170, height: 210)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(15)
            
            Text(item.name)
                .font(.system(size: 14, weight: .medium))
                .fixedSize(horizontal: false, vertical: true)
                .frame(width: 170, height: 30, alignment: .leading)
                .multilineTextAlignment(.leading)
            
            Text(item.price)
                .font(.system(size: 18, weight: .semibold))
                .frame(width: 170, alignment: .leading)
        }
    }
}

struct DetailView: View {
    let item: Item
    
    var body: some View {
        VStack {
            Text("Item Detail")
                .font(.title)
                .padding()
            
            Text("Name: \(item.name)")
                .font(.headline)
                .padding()
            
            Text("Price: \(item.price)")
                .font(.subheadline)
                .padding()
            
            // Add any other details you want to display
            
            Spacer()
        }
        .navigationBarTitle("Detail", displayMode: .inline)
    }
}

#Preview {
    Test()
}
