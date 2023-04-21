//
//  TaskListViewControllerTests.swift
//  MVC-TodoAppTests
//
//  Created by administrador on 20/04/23.
//

import XCTest
@testable import MVC_TodoApp

final class TaskListViewControllerTests: XCTestCase {

    private var sut: TaskListViewController!
    private var navigationController: MockNavigationController!
    private var taskListService: TaskListServiceProtocol!
    private var taskService: TaskServiceProtocol!
    
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
        self.taskListService = MockTaskListService(lists: [list])
        self.taskService = MockTaskService(list: list)
        self.sut = TaskListViewController(taskListModel: list, taskListService: taskListService, taskService: taskService)
        self.navigationController = MockNavigationController(rootViewController: UIViewController())
        self.navigationController.pushViewController(self.sut, animated: false)
        self.navigationController.vcIsPushed = false
    }

    override func tearDownWithError() throws {
        self.sut = nil
        self.navigationController = nil
        self.taskService = nil
        self.taskListService = nil
    }

    func testTaskListViewController_whenNavigateBackIsCalled_shouldPopToHomeView(){
        // Act
        sut.navigateBack()
        // Assert
        XCTAssertTrue(self.navigationController.vcIsPoped)
    }
    
    func testAddTask_whenAddedATask_shouldBeOneOnDatabase() {
        // Act
        taskService.saveTask(task, in: list)
        // Assert
        XCTAssertEqual(taskService.fetchTasksForList(list).count, 1)
    }
    
    func testTaskListViewController_whenAddTaskIsCalled_shouldPushAddTaskView(){
        // Act
        sut.addTaskAction()
        // Assert
        XCTAssertTrue(self.navigationController.vcIsPushed)
    }
    
    func testTaskListViewController_whenUpdateTaskIsCalled_shouldUpdateTaskOnDatabase(){
        // Act
        taskService.saveTask(task, in: list)
        var updatedTask = task
        updatedTask.done = true
        sut.updateTask(updatedTask)
        guard let fetchedTask = taskService.fetchTasksForList(list).first else {
            XCTFail("Task don't exists")
            return
        }
        // Assert
        XCTAssertTrue(fetchedTask.done)
    }
    
    func testTaskListViewController_whenDeleteTaskIsCalled_thereShouldBeNoneTaskOnDatabase(){
        // Act
        sut.deleteTask(task)
        // Assert
        XCTAssertEqual(self.taskService.fetchTasksForList(list).count, 0)
    }
    
    
}
