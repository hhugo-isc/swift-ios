//
//  AddTaskViewControllerTests.swift
//  MVC-TodoAppTests
//
//  Created by administrador on 21/04/23.
//

import XCTest
@testable import MVC_TodoApp

final class AddTaskViewControllerTests: XCTestCase {

    private var sut: AddTaskViewController!
    private var taskService: TaskServiceProtocol!
    private var navigationController: MockNavigationController!
    
    private let task = TaskModel(id: ProcessInfo().globallyUniqueString,
                                 title: "Test title",
                                 icon: "test.icon",
                                 done: false, createdAt: Date())
    
    private let list = TaskListModel(id: ProcessInfo().globallyUniqueString,
                                  title: "Test title",
                                  icon: "test.icon",
                                  tasks: [TaskModel](),
                                  createdAt: Date())
    
    override func setUpWithError() throws {
        taskService = MockTaskService(list: list)
        sut = AddTaskViewController(taskService: taskService, taskListModel: list)
        navigationController = MockNavigationController(rootViewController: UIViewController())
        navigationController.pushViewController(sut, animated: false)
    }

    override func tearDownWithError() throws {
        self.sut = nil
        self.taskService = nil
        self.navigationController = nil
    }
    
    func testAddTaskViewController_whenAddActionIsCalled_thereShouldBeOneTaskOnDatabase(){
        // Act
        sut.addTask(task)
        // Assert
        XCTAssertEqual(taskService.fetchTasksForList(list).count, 1)
    }
    
    
}
