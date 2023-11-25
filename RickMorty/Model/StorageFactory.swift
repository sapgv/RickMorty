//
//  StorageFactory.swift
//  RickMorty
//
//  Created by Grigory Sapogov on 25.11.2023.
//

import Foundation

class StorageFactory {
    
    var useCoreData: Bool
    
    init(useCoreData: Bool) {
        self.useCoreData = useCoreData
    }
    
    func createStorage() -> IStorage {
        if self.useCoreData {
            return StorageCoreData()
        }
        else {
            return Storage()
        }
    }
    
//    func createStorageUserDafaults() -> IStorage {
//
//        return Storage()
//
//    }
//
//    func createStorageCoreData() -> IStorage {
//
//        return StorageCoreData()
//
//    }
    
}
