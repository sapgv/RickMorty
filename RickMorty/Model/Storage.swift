//
//  Storage.swift
//  RickMorty
//
//  Created by Grigory Sapogov on 25.11.2023.
//

import Foundation

protocol IStorage {
    
    func fetch() -> [Episode]
    
    func save(array: [Episode])
    
}

class Storage: IStorage {
    
    func fetch() -> [Episode] {
        
        let array = UserDefaults.standard.value(forKey: "Episodes") as? [Episode] ?? []
        return array
        
    }
    
    func save(array: [Episode]) {
        
//        UserDefaults.standard.set(array, forKey: "Episodes")
//        UserDefaults.standard.synchronize()
        
    }
    
    
}

class StorageCoreData: IStorage {
    
    func fetch() -> [Episode] {
        
        
    }
    
    func save(array: [Episode]) {
        
        
    }
    
}
