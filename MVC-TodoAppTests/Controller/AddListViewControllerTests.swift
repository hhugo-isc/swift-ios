//
//  AddListViewControllerTests.swift
//  MVC-TodoAppTests
//
//  Created by administrador on 20/04/23.
//

import XCTest
@testable import MVC_TodoApp

final class AddListViewControllerTests: XCTestCase {

    private var sut: AddListViewController!
    private var mockNavigationController: MockNavigationController!
    private var taskListService: MockTaskListService!
    private let list = TaskListModel(id: ProcessInfo().globallyUniqueString,
                                  title: "Test title",
                                  icon: "test.icon",
                                  tasks: [TaskModel](),
                                  createdAt: Date())
    
    override func setUpWithError() throws {
        self.taskListService = MockTaskListService(lists: [TaskListModel]())
        self.sut = AddListViewController(taskListService: taskListService)
        self.mockNavigationController = MockNavigationController(rootViewController: UIViewController())
        self.mockNavigationController.pushViewController(self.sut, animated: false)
    }

    override func tearDownWithError() throws {
        self.sut = nil
        self.mockNavigationController = nil
        self.taskListService = nil
    }

    func testAddListViewController_whenNavigateBackIsCalled_thenPopHomeIsCalled() {
        // Act
        sut.navigateBack()
        // Assert
        XCTAssertTrue(self.mockNavigationController.vcIsPoped)
    }
    
    func testAddListViewController_whenAddListIsCalled_thenShouldPopHomeIsCalled(){
        // Act
        sut.addList(TaskListModel())
        // Assert
        XCTAssertTrue(self.mockNavigationController.vcIsPoped)
    }
    
    func testAddListViewController_whenAddListIsCalled_thenShouldBeOneOnDatabase(){
        // Act
        sut.addList(TaskListModel())
        // Assert
        XCTAssertEqual(self.taskListService.fetchLists().count, 1)
    }

}
