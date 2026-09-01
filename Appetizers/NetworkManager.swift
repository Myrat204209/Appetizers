//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Azat Japarov on 31.08.26.
//

import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    static let baseURL = "https://my-json-server.typicode.com/Myrat204209/Appetizer-fakeserver/"
    private let appetizerURL = baseURL + "request"
    
    
    
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
            print("Data from the server \(type(of: data))")
            Task { @MainActor in
                do {
                    let decoder = JSONDecoder()
//                    let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                    let decodedResponse = try decoder.decode([Appetizer].self, from: data)
                    completed(.success(decodedResponse))
                } catch {
                    completed(.failure(.invalidData))
                }
            }
        }
        
        task.resume()
    }
    
    
    func downloadImage(from urlString: String, completed: @escaping(UIImage?)-> Void) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            return completed(image)
        }
        
        guard let url = URL(string: urlString) else {
            return completed(nil)
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                return completed(nil)
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
            
        }
        
        task.resume()
        
        
    }
    
}
