//
//  DetailsView.swift
//  Appetizers
//
//  Created by Azat Japarov on 01.09.26.
//

import SwiftUI

struct AppetizerDetailView: View {

    @EnvironmentObject var order : Order
    
    let appetizer : Appetizer
    @Binding var isShowingDetail : Bool
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            VStack  {
                Text(appetizer.name)
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack (spacing: 40) {
                    NutritionInfo(title: "Calories", value: appetizer.calories)
                    NutritionInfo(title: "Carbs", value: appetizer.carbs)
                    NutritionInfo(title: "Protein", value: appetizer.protein)
                }
            }
            
            Spacer()
            
            Button {
                order.add(appetizer)
                isShowingDetail = false
            } label: {
//                AppetizerButton(title: "$\(appetizer.price, default : "%.2f") - Add to Order")
                
                Text("$\(appetizer.price, default : "%.2f") - Add to Order")
            }
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)  
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 40)
        .overlay(Button {
            isShowingDetail = false
            
        } label: {
            XDismissButton()
        } ,alignment: .topTrailing)
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(true))
}


struct NutritionInfo : View {

    let title : String
    let value : Int
    
    var body: some View {
        VStack {
            Text(title)
                .bold()
                .font(.caption)
            Text("\(value)")
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
