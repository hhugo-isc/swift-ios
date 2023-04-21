//
//  HomeViewTests.swift
//  MVC-TodoAppTests
//
//  Created by administrador on 21/04/23.
//

import XCTest
@testable import MVC_TodoApp

final class HomeViewTests: XCTestCase {

    private var sut: HomeView!
    
    override func setUpWithError() throws {
        self.sut = HomeView()
        let list = TaskListModel(id: "12345-67890",
                                 title: "Test List",
                                 icon: "test.icon",
                                 tasks: [TaskModel](),
                                 createdAt: Date())
        sut.setTaskLists([list])
    }

    override func tearDownWithError() throws {
        self.sut = nil
        super.tearDown()
    }
    
    func testHomeView_whenViewIsCreated_componentsShouldBeInstanciated(){
        XCTAssertNotNil(sut.pageTitle)
        XCTAssertNotNil(sut.tableView)
        XCTAssertNotNil(sut.addListButton)
        XCTAssertNotNil(sut.emptyState)
    }

    func testHomeView_whenModelHasAList_emptyStateShouldNotBeDisplayed(){
        XCTAssertTrue(self.sut.emptyState.isHidden)
    }
    
    func testHomeView_whenModelHasZeroList_emptyStateShouldBeDisplayed(){
        // Arrange
        self.sut.setTaskLists([TaskListModel]())
        // Assert
        XCTAssertFalse(self.sut.emptyState.isHidden)
    }
    
    func testHomeView_whenAddListButtonIsTapped_shouldBeCalledAddListAction(){
        // Arrange
        let addButton = self.sut.addListButton
        
        // Act
        guard let addListAction = addButton.actions(forTarget: sut, forControlEvent: .touchUpInside) else {
            XCTFail()
            return
        }
        
        // Assert
        XCTAssertNotNil(addButton)
        XCTAssertTrue(addListAction.contains("addListAction"))
    }
    
    func testHomeView_whenModelHasAList_thereShouldBeOneRowInTableView(){
        XCTAssertEqual(self.sut.tableView.numberOfRows(inSection: 0), 1)
    }
    
    func testHomeView_whenModelHasAList_shouldBeCalledCellAtIndexpath(){
        // Arrange
        let indexpath = IndexPath(row: 0, section: 0)
        
        // Act
        let cell = self.sut.tableView.dataSource?.tableView(sut.tableView, cellForRowAt: indexpath)
        
        // Assert
        XCTAssertNotNil(cell)
    }
    
    func testHomeView_whenListIsDeleted_thereShouldBeNoneOnModel(){
        // Arrange
        let indexPath = IndexPath(row: 0, section: 0)
        // Act
        self.sut.tableView.dataSource?.tableView?(self.sut.tableView, commit: .delete, forRowAt: indexPath)
        
        // Assert
        XCTAssertEqual(self.sut.tasksList.count, 0)
    }
    
}
