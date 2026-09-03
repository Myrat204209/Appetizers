//
//  ContentView.swift
//  Appetizers
//
//  Created by Azat Japarov on 31.08.26.
//

import SwiftUI

struct AppetizerTabView: View {
    
    @EnvironmentObject var order : Order
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house"){
                AppetizerListView()
            }
            
            Tab("Account", systemImage: "person"){
                AccountView()
            }

            Tab("Order", systemImage: "bag"){
                OrderView()
                    
            }.badge(order.items.count)

        }
        .tint(.brandPrimary)
        
            
    }
}

#Preview {
    AppetizerTabView() .environmentObject(Order())

    
}
