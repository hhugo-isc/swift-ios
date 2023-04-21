//
//  MockTaskService.swift
//  MVC-TodoAppTests
//
//  Created by administrador on 20/04/23.
//

import Foundation
import CoreData
@testable import MVC_TodoApp

class MockTaskService: TaskServiceProtocol {
    
    private var list: TaskListModel!
   
    required init(coreDataManager: CoreDataManager) {}
        
    convenience init(list: TaskListModel) {
        self.init(coreDataManager: CoreDataManager.shared)
        self.list = list
    }
        
    func fetchTasksForList(_ taskList: TaskListModel) -> [TaskModel] {
        return list.tasks
    }
    
    func saveTask(_ task: TaskModel, in taskList: TaskListModel) {
        list = taskList
        list.tasks.append(task)
    }
    
    func updateTask(_ task: TaskModel) {
        guard let tasks = list.tasks else { return }
        var updatedTasks = [TaskModel]()
        tasks.forEach({
            var updatedTask = $0
            if $0.id == task.id {
                updatedTask.done.toggle()
            }
            updatedTasks.append(updatedTask)
        })
        list.tasks = updatedTasks
    }
    
    func deleteTask(_ task: TaskModel) {
        list.tasks = list.tasks.filter({ $0.id != task.id })
    }
}
