//
//  AppetizersListView.swift
//  Appetizers
//
//  Created by Azat Japarov on 31.08.26.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.appetizers) { appetizer in
                AppetizerListCell(appetizer: appetizer)
            }
            .navigationTitle("🍟 Appetizers")
        }
        .onAppear{
            viewModel.getAppetizers()
        }
        
    }
   
}

#Preview {
    AppetizerListView()
}
