//
//  Api.swift
//  RickMorty
//
//  Created by Grigory Sapogov on 25.11.2023.
//

import Foundation

protocol IApi: AnyObject {
    
    func fetchEpisodes(completion: @escaping (Swift.Result<[[String: Any]], Error>) -> Void)
    
    
}
class Api: IApi {
    
    func fetchEpisodes(completion: @escaping (Swift.Result<[[String: Any]], Error>) -> Void) {
        
        guard let url = URL(string: "https://rickandmortyapi.com/api/episode") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(ApiError.invalidData))
                return
            }
            
            guard let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                completion(.failure(ApiError.invalidData))
                return
            }
            
            guard let array = json["results"] as? [[String: Any]] else {
                completion(.failure(ApiError.invalidData))
                return
            }
            
            DispatchQueue.main.async {
                completion(.success(array))
            }
            
        }
        
        task.resume()
        
    }
    
    
}
