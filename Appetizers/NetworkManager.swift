//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Azat Japarov on 31.08.26.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/appetizers/"
    
    private let appetizerURL = baseURL + "appetizers"
    
    private init() {}
    
    func getAppetizers(completed : @escaping (Result<[Appetizer], AppetizerError>) -> Void) {
        guard let url = URL(string: appetizerURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard error == nil else {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            Task { @MainActor in
                do {
                    let decoder = JSONDecoder()
                    let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                    completed(.success(decodedResponse.request))
                } catch {
                    completed(.failure(.invalidData))
                }
            }
        }
        
        task.resume()
    }
    
}
