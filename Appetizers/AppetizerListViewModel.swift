//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Azat Japarov on 31.08.26.
//

import SwiftUI
internal import Combine

final class AppetizerListViewModel : ObservableObject {
    
    @Published var appetizers : [Appetizer] = []
    
    func getAppetizers() {
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        }
    }
}
