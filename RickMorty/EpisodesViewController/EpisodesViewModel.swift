//
//  EpisodesViewModel.swift
//  RickMorty
//
//  Created by Grigory Sapogov on 25.11.2023.
//

import Foundation

enum ApiError: Error {
    case invalidData
}

protocol IEpisodesViewModel {
    
    var episodes: [Episode] { get }
    
    var updateCompletion: ((Error?) -> Void)? { get set }
    
    func updateData()
    
}

class EpisodesViewModel: IEpisodesViewModel {
    
    var updateCompletion: ((Error?) -> Void)? = nil

    private(set) var episodes: [Episode] = []
    
    private let api: IApi
    
    private let storage: IStorage
    
    init(api: IApi = Api(),
         storage: IStorage) {
        self.api = api
        self.storage = storage
        self.episodes = storage.fetch()
    }
    
    func updateData() {
        
        self.api.fetchEpisodes { [weak self] result in
            
            switch result {
            case let .failure(error):
                self?.updateCompletion?(error)
            case let .success(array):
                
                DispatchQueue.global().async {
                    
                    let episodes = array.map { data in
                        Episode(data: data)
                    }
                    
                    self?.episodes = episodes
                    
                    self?.storage.save(array: episodes)
                    
                    DispatchQueue.main.async {
                        self?.updateCompletion?(nil)
                    }
                    
                }

            }
            
        }
        
    }
    
}

/*
 
 
 1 Нарушение
 
 ViewModel
    |
    |
    ↓
   Api
 
 2 Согласовано
 
 ViewModel
    |
    |
    ↓
   IApi
    ⇧
    |
    |
   API

 
 */
