//
//  TaskListModel.swift
//  MVC-TodoApp
//
//  Created by administrador on 17/04/23.
//

import Foundation
import CoreData

struct TaskListModel {
    var id: String!
    var title: String!
    var icon: String!
    var tasks: [TaskModel]!
    var createdAt: Date!
}

extension TaskListModel: EntityModelMapProtocol{
    
    typealias EntityType = TaskList
    
    func mapToEntityInContext(_ context: NSManagedObjectContext) -> EntityType {
        let taskList: TaskList = .init(context: context)
        taskList.id = self.id
        taskList.title = self.title
        taskList.icon = self.icon
        
        if let tasks = self.tasks {
            tasks.forEach({
                $0.mapToEntityInContext(context).list = taskList
            })
        }
        
        taskList.createdAt = self.createdAt
        return taskList
    }
    
    static func mapFromEntity(_ entity: EntityType) -> Self{
        
        guard let tasksListed = entity.tasks else {
            return .init(title: entity.title,
                         icon: entity.icon,
                         tasks: [TaskModel](),
                         createdAt: entity.createdAt)
        }
        
        var tasks = [TaskModel]()
        for task in tasksListed {
            tasks.append(TaskModel.mapFromEntity(task as! Task))
        }
        
        return .init(id: entity.id,
                     title: entity.title,
                     icon: entity.icon,
                     tasks: tasks,
                     createdAt: entity.createdAt)
    }
    
}
