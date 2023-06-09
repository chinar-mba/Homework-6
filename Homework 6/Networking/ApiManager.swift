//
//  ApiManager.swift
//  Homework 6
//
//  Created by Chinara on 6/8/23.
//

import Foundation

class ApiManager {
    static let shared = ApiManager()
    
    func getRequest(completion: @escaping (Result<ProductModel, Error>) -> Void) {
        guard let url = URL(string: "https://dummyjson.com/products") else {return}
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {return}
            
            do {
                let model = try JSONDecoder().decode(ProductModel.self, from: data)
                completion(.success(model))
            }
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
