//
//  Order.swift
//  Appetizers
//
//  Created by Azat Japarov on 02.09.26.
//

import SwiftUI
internal import Combine

final class Order : ObservableObject {
    @Published var items : [Appetizer] = []
    
    var totalPrice : Double {
        items.reduce(0,{$0 + $1.price})
    }
    
    func add(_ appetizer : Appetizer) {
        items.append(appetizer)
    }
    
    
    func deleteItems(at offsets : IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
    
}
