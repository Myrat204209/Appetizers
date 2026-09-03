//
//  OrderView.swift
//  Appetizers
//
//  Created by Azat Japarov on 31.08.26.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order : Order
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    List {
//                        ForEach(MockData.orderItems) { appetizer in
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                            
                        }.onDelete(perform: order.deleteItems)
                    }
                    .listStyle(.plain)
                 
                    Button {
                        
                    } label: {
//                        AppetizerButton(title: "$\(order.totalPrice, default : "%.2f") - Place Order")
                        Text("$\(order.totalPrice, default : "%.2f") - Place Order")
                        
                    }
//                    .modifier(StandardButtonStyle())
                    .standardButtonStyle()
                    .padding(.bottom, 25)
                    
                }

                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order", message: "You have no items in your order. Please add an appetizer!")
                }
            }.navigationTitle("🧾 Orders")
        }
    }
    
   
}

#Preview {
    OrderView().environmentObject(Order())
}
