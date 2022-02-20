//
//  DataPersistenceManager.swift
//  NetflixClone
//
//  Created by Irakli Sokhaneishvili on 20.02.22.
//

import Foundation
import UIKit
import CoreData


class DataPersistenceManager {
    
    enum DatabaseError: Error {
        case failedToSaveData
    }
    
    static let shared = DataPersistenceManager()
    
    func downloadTitleWith(model: Title, completion: @escaping(Result<Void, Error>) -> Void) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let item = TitleItem(context: context)
        
        item.id = Int64(model.id)
        item.originalTitle = model.originalTitle
        item.originalName = model.originalName
        item.overview = model.overview
        item.mediaType = model.mediaType
        item.posterPath = model.posterPath
        item.releaseDate = model.releaseDate
        item.voteCount = Int64(model.voteCount)
        item.voteAvarage = model.voteAvarage ?? 0.0
        
        do {
            try context.save()
            completion(.success(()))
        } catch {
            print(error.localizedDescription)
            completion(.failure(DatabaseError.failedToSaveData))
        }
        
    }
}
