//
//  EmptyState.swift
//  Appetizers
//
//  Created by Azat Japarov on 02.09.26.
//

import SwiftUI

struct EmptyState: View {
    let imageName : String
    let message : String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                
                Text(message)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding()
            }
        }
    }
}

#Preview {
    EmptyState(imageName: "empty-order", message: "This is our test message. \nI'm making it a little long for testing")
}
