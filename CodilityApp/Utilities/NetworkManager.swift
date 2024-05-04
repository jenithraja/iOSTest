//
//  NetworkManager.swift
//  CodilityApp
//
//  Created by Mohamed jenith on 5/1/24.
//

import UIKit

class NetworkManager: NSObject {
    static let shared = NetworkManager()

    private let cache = NSCache<NSString, UIImage>()
    private override init() {}
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    func fetch<T: Codable>(urlString:String, parse: @escaping (Data) -> T?, completion: @escaping (Result <T?, NetworkError>) -> Void) {
        let url = self.baseURL.appendingPathComponent(urlString)

        URLSession.shared.dataTask(with: url){ data, response, error in
            
            if let _ =  error {
                completion(.failure(.unableToComplete))
                return
            }
                        
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            let result = parse(data)
            completion(.success(result))

        }.resume()
    }
    
    func downloadImage(from urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }

}
