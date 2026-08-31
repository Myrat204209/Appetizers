//
//  AppetizerListCell.swift
//  Appetizers
//
//  Created by Azat Japarov on 31.08.26.
//
import SwiftUI

struct AppetizerListCell : View {
    
    let appetizer : Appetizer
    var body : some View {
        HStack {
            Image("asian-flank-steak")
                .resizable()
                .aspectRatio( contentMode: .fit)
                .frame(width: 120, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack (alignment: .leading, spacing: 10){
                Text("\(appetizer.name)")
                    .font(.title2)
                    .fontWeight(.medium)
                    .lineLimit(2)
                    
                Text("$\(appetizer.price.formatted())")
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
            }
            .padding(.leading)
        }

    }
}
#Preview {
    AppetizerListCell(appetizer: MockData.sampleAppetizer)
}

