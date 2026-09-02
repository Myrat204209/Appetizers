//
//  AppetizerButton.swift
//  Appetizers
//
//  Created by Azat Japarov on 02.09.26.
//

import SwiftUI

struct AppetizerButton: View {
    
    let title : String
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundStyle(.white)
            .background(.brandPrimary)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    AppetizerButton(title: "Button")
}
