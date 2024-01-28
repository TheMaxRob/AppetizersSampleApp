//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Max Roberts on 12/30/23.
//

import UIKit


final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"
    
    private init() {}
    
    /*func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
        
        // Check for valid URL
        guard let url = URL(string: appetizerURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        // Create network call based on valid URL
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            // Check unable to complete, unknown error
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
        }
            
            // Check for valid response
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            
            // Check for valid data
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            
            //  SUCCESS
            
            // Handling Success
            do {
                let decoder = JSONDecoder()
                
                // decodedResponse is an AppetizerResponse, so we get its request, which is an array of appetizers
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                completed(.success(decodedResponse.request))
                          } catch {
                    completed(.failure(.invalidData))
            }
        }
        task.resume()
    }*/
    
    func getAppetizers() async throws -> [Appetizer] {
        
        // Check for valid URL
        guard let url = URL(string: appetizerURL) else {
            throw APError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
            do {
                let decoder = JSONDecoder()
                
                // decodedResponse is an AppetizerResponse, so we get its request, which is an array of appetizers
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                return decodedResponse.request
            } catch {
                throw APError.invalidData
            }
    }
        
    
    
    
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)
        
        // Check if we already have the image in the cache
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data , let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }
}
