//
//  TaskListService.swift
//  MVC-TodoApp
//
//  Created by administrador on 17/04/23.
//

import Foundation
import CoreData

protocol TaskListServiceProtocol: AnyObject {
    init(coreDataManager: CoreDataManager)
    func saveTasksList(_ list: TaskListModel)
    func fetchLists() -> [TaskListModel]
    func fetchListWithId(_ id: String) -> TaskListModel?
    func deleteList(_ list: TaskListModel)
}

class TaskListService: TaskListServiceProtocol {
    
    let context: NSManagedObjectContext
    var coreDataManager: CoreDataManager
    
    required init(coreDataManager: CoreDataManager = CoreDataManager.shared) {
        self.context = coreDataManager.mainContext
        self.coreDataManager = coreDataManager
    }
    
    func saveTasksList(_ list: TaskListModel) {
        _ = list.mapToEntityInContext(context)
        coreDataManager.saveContext(context)
    }
    
    func fetchLists() -> [TaskListModel] {
        var lists = [TaskListModel]()
        do {
            let fetchRequest: NSFetchRequest<TaskList> = TaskList.fetchRequest()
            let value = try context.fetch(fetchRequest)
            lists = value.map({ TaskListModel.mapFromEntity($0) })
            lists = lists.sorted(by: { $0.createdAt.compare($1.createdAt) == .orderedDescending })
        } catch {
            debugPrint("CoreData Error")
        }
        return lists
    }
    
    func fetchListWithId(_ id: String) -> TaskListModel? {
        do {
            let fetchRequest: NSFetchRequest<TaskList> = TaskList.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "id = %@", id)
            let listEntities = try context.fetch(fetchRequest)
            guard let list = listEntities.first else {
                return nil
            }
            return TaskListModel.mapFromEntity(list)
        } catch {
            debugPrint("CoreData Error")
            return nil
        }
    }
    
    func deleteList(_ list: TaskListModel) {
        do {
            let fetchRequest: NSFetchRequest<TaskList> = TaskList.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "id = %@", list.id)
            let listEntities = try context.fetch(fetchRequest)
            for listEntity in listEntities {
                context.delete(listEntity)
            }
            coreDataManager.saveContext(context)
        } catch {
            debugPrint("CoreData Error")
        }
    }
}
