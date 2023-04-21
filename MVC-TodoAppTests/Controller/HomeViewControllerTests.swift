//
//  HomeViewControllerTests.swift
//  MVC-TodoAppTests
//
//  Created by administrador on 17/04/23.
//

import XCTest
@testable import MVC_TodoApp

final class HomeViewControllerTests: XCTestCase {

    var sut: HomeViewController!
    var navigationController: MockNavigationController!
    var mockTaskListService: TaskListServiceProtocol!
    var mockTaskService: TaskServiceProtocol!
    
    let list = TaskListModel(id: ProcessInfo().globallyUniqueString,
                                  title: "Test title",
                                  icon: "test.icon",
                                  tasks: [TaskModel](),
                                  createdAt: Date())
    
    override func setUpWithError() throws {
        self.mockTaskListService = MockTaskListService(lists: [list])
        self.mockTaskService = MockTaskService(list: list)
        self.sut = HomeViewController(taskListService: mockTaskListService, taskService: mockTaskService)
        self.navigationController = MockNavigationController(rootViewController: self.sut)
    }

    override func tearDownWithError() throws {
        self.sut = nil
        self.navigationController = nil
        self.mockTaskListService = nil
        self.mockTaskService = nil
    }
    
    func testHomeViewController_whenAddListIsCalled_thenPushAddListVCCalled(){
        // Arrange
        // Act
        sut.addListAction()
        // Assert
        XCTAssertTrue(navigationController.vcIsPushed)
    }
    
    func testHomeViewController_whenTaskListSelected_shouldPushTaskListVC(){
        // Act
        sut.selectedList(TaskListModel())
        // Assert
        XCTAssertTrue(navigationController.vcIsPushed)
    }
    
    func testHomeViewController_whenTaskListIsDeleted_shouldBeNoneOnDatabase(){
        // Act
        sut.deleteList(list)
        // Assert
        XCTAssertEqual(mockTaskListService.fetchLists().count, 0)
    }
    
    

}
