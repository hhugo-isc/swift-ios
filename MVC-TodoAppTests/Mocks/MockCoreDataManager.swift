//
//  MockCoreDataManager.swift
//  MVC-TodoAppTests
//
//  Created by administrador on 20/04/23.
//

import Foundation
import CoreData
@testable import MVC_TodoApp

class MockCoreDataManager: CoreDataManager{
        
    override init(){
        super.init()
        
       let persistentStoreDescription = NSPersistentStoreDescription()
        persistentStoreDescription.type = NSInMemoryStoreType
        
        let inMemoryContainer = NSPersistentContainer(name: "ToDoList")
        inMemoryContainer.persistentStoreDescriptions = [persistentStoreDescription]
        inMemoryContainer.loadPersistentStores{_, error in
            if let error = error as NSError? {
                            fatalError("Unresolved error \(error), \(error.userInfo)")
                        }
        }
        
        self.persistentContainer = inMemoryContainer
    }
    
}
