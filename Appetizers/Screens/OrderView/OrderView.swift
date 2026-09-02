//
//  OrderView.swift
//  Appetizers
//
//  Created by Azat Japarov on 31.08.26.
//

import SwiftUI

struct OrderView: View {
    
    @State private var orderItems = MockData.orderItems
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(orderItems) { appetizer in
                        AppetizerListCell(appetizer: appetizer)
                        
                    }.onDelete(perform: deleteItems)
                }
                .listStyle(.plain)
             
                Button {
                    
                } label: {
                    AppetizerButton(title: "$99.99 - Place Order")
                }
                .padding(.bottom, 25)
                
            }
            .navigationTitle("🧾 Orders")
        }
    }
    
    func deleteItems(at offsets : IndexSet) {
        orderItems.remove(atOffsets: offsets)
    }
}

#Preview {
    OrderView()
}
