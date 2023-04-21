//
//  MockTaskListService.swift
//  MVC-TodoAppTests
//
//  Created by administrador on 20/04/23.
//

import Foundation
import CoreData
@testable import MVC_TodoApp

class MockTaskListService: TaskListServiceProtocol {
    
    
    
    private var lists: [TaskListModel] = [TaskListModel]()

    required init(coreDataManager: CoreDataManager) {}

    convenience init(lists: [TaskListModel]) {
        self.init(coreDataManager: CoreDataManager.shared)
        self.lists = lists
    }
    
    func saveTasksList(_ list: MVC_TodoApp.TaskListModel) {
        lists.append(list)
    }
    
    func deleteList(_ list: MVC_TodoApp.TaskListModel) {
        lists = lists.filter({ $0.id != list.id })
    }
    
    func fetchLists() -> [TaskListModel] {
        return lists
    }

    func fetchListWithId(_ id: String) -> TaskListModel? {
        return lists.filter({ $0.id == id }).first
    }
    
    func deleteTaskList(_ list: TaskListModel) {
        lists = lists.filter({ $0.id != list.id })
    }
}
