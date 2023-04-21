//
//  TaskModel.swift
//  MVC-TodoApp
//
//  Created by administrador on 17/04/23.
//

import Foundation
import CoreData

struct TaskModel {
    var id: String!
    var title: String!
    var icon: String!
    var done: Bool!
    var createdAt: Date!
}

extension TaskModel: EntityModelMapProtocol {
    typealias EntityType = Task
    
    func mapToEntityInContext(_ context: NSManagedObjectContext) -> Task {
        let task: Task = .init(context: context)
        task.id = self.id
        task.icon = self.icon
        task.title = self.title
        task.createdAt = self.createdAt
        return task
    }
    
    static func mapFromEntity(_ entity: Task) -> TaskModel {
        return .init(id: entity.id,
                     title: entity.title,
                     icon: entity.icon,
                     done: entity.done,
                     createdAt: entity.createdAt)
    }
    
    
    
}
