//
//  Episode.swift
//  RickMorty
//
//  Created by Grigory Sapogov on 25.11.2023.
//

import Foundation

class Episode: Codable {
    
    let id: Int
    
    let name: String
    
    let episode: String
    
    init(data: [String: Any]) {
        self.id = data["id"] as? Int ?? 0
        self.name = data["name"] as? String ?? ""
        self.episode = data["episode"] as? String ?? ""
    }
    
}
