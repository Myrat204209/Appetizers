//
//  Appetizer.swift
//  Appetizers
//
//  Created by Azat Japarov on 31.08.26.
//

import Foundation

struct Appetizer : Decodable, Identifiable {
    let id : Int
    let name : String
    let description : String
    let price : Double
    let imageURL : String
    let calories : Int
    let carbs : Int
    let protein : Int
}

struct AppetizerResponse {
    let request : [Appetizer]
}

struct MockData {
    
    static let sampleAppetizer = Appetizer(id: 0001,
                                           name: "Test Appetizer",
                                           description: "This is the description for my appetizer. It's yummy",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 99,
                                           carbs: 99,
                                           protein: 99)
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
}
