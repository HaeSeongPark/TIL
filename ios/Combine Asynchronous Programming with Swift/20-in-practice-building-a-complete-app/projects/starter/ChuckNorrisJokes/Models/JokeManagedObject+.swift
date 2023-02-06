//
//  JokeManagedObject+.swift
//  ChuckNorrisJokes
//
//  Created by rhino Q on 2023/02/06.
//  Copyright © 2023 Scott Gardner. All rights reserved.
//

// 1
import Foundation
import SwiftUI
import CoreData
import ChuckNorrisJokesModel

// 2
extension JokeManagedObject {
    // 3
    static func save(joke:Joke, inViewContext viewContext:NSManagedObjectContext) {
        // 4
        guard joke.id != "error" else { return }
        
        // 5
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:
                                                                    String(describing: JokeManagedObject.self))
        
        // 6
        fetchRequest.predicate = NSPredicate(format: "id = %@", joke.id)
        
        // 7
        // 저장하고자 하는 joke가 이미 있는경우, 업데이트 한다.
        if let results = try? viewContext.fetch(fetchRequest),
           let existing = results.first as? JokeManagedObject {
            existing.value = joke.value
            existing.categories = joke.categories as NSArray
        } else { // 없으면, 새로 생성
            // 8
            let newJoke = self.init(context: viewContext)
            newJoke.id = joke.id
            newJoke.value = joke.value
            newJoke.categories = joke.categories as NSArray
        }
        
        // 9
        do {
            try viewContext.save()
        } catch {
            fatalError("\(#file), \(#function), \(error.localizedDescription)")
        }
    }
}

extension Collection where Element == JokeManagedObject, Index == Int {
    func delete(at indices:IndexSet, inViewContext viewContext:NSManagedObjectContext) {
        indices.forEach { index in
            viewContext.delete(self[index])
        }
        
        do {
            try viewContext.save()
        } catch {
            fatalError("\(#file), \(#function), \(error.localizedDescription)")
        }
    }
}
