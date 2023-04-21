//
//  TaskListViewController.swift
//  MVC-TodoApp
//
//  Created by administrador on 20/04/23.
//

import Foundation
import UIKit

class TaskListViewController: UIViewController{
    
    private var taskListView = TaskListView()
    private var taskListService: TaskListServiceProtocol!
    private var taskService: TaskServiceProtocol!
    private var taskListModel: TaskListModel!
    
    init(taskListModel: TaskListModel, taskListService: TaskListServiceProtocol, taskService: TaskServiceProtocol){
        super.init(nibName: nil, bundle: nil)
        self.taskListModel = taskListModel
        self.taskListService = taskListService
        self.taskService = taskService
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(contextObjectsDidChange), name: NSNotification.Name.NSManagedObjectContextObjectsDidChange, object: CoreDataManager.shared.mainContext)
        taskListView.setTaskList(taskListModel)
    }
    
    override func loadView() {
        super.loadView()
        self.navigationController?.navigationBar.isHidden = true
        setupTaskListView()
    }
    
    private func setupTaskListView(){
        taskListView.delegate = self
        self.view = taskListView
    }
    
    private func backToHome(){
        self.navigationController?.popViewController(animated: true)
    }
    
    private func updateTasksList() {
        guard let list = taskListService.fetchListWithId(taskListModel.id) else { return }
        taskListModel = list
        taskListView.setTaskList(taskListModel)
    }
    
    @objc func contextObjectsDidChange(){
        updateTasksList()
    }
}

extension TaskListViewController: TaskListViewDelegate{
    func addTaskAction() {
        let addTaskViewController = AddTaskViewController(taskService: taskService, taskListModel: taskListModel)
        addTaskViewController.modalPresentationStyle = .pageSheet
        present(addTaskViewController, animated: true)
    }
    
    func updateTask(_ task: TaskModel) {
        self.taskService.updateTask(task)
    }
    
    func deleteTask(_ task: TaskModel) {
        self.taskService.deleteTask(task)
    }
}

extension TaskListViewController: BackButtonDelegate{
    func navigateBack() {
        self.backToHome()
    }
}
