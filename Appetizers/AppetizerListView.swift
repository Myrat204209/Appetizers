//
//  AppetizersListView.swift
//  Appetizers
//
//  Created by Azat Japarov on 31.08.26.
//

import SwiftUI

struct AppetizerListView: View {
    var body: some View {
        NavigationStack {
            List(MockData.appetizers) { appetizer in
                AppetizerListCell(appetizer: appetizer)
            }
            .navigationTitle("🍟 Appetizers")
        }
        
    }
}

#Preview {
    AppetizerListView()
}
