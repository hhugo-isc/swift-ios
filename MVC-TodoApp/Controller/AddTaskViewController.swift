//
//  AddTaskViewController.swift
//  MVC-TodoApp
//
//  Created by administrador on 21/04/23.
//

import Foundation
import UIKit

class AddTaskViewController: UIViewController{
    
    private var addTaskView =  AddTaskView()
    private var taskService: TaskServiceProtocol!
    private var taskListModel: TaskListModel!
    
    convenience init(taskService: TaskServiceProtocol, taskListModel: TaskListModel){
        self.init(nibName: nil, bundle: nil)
        self.taskService = taskService
        self.taskListModel = taskListModel
    }
    
    override func loadView() {
        super.loadView()
        self.navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        setupAddTaskView()
    }
    
    func setupAddTaskView(){
        addTaskView.delegate = self
        self.view = addTaskView
    }
    
}

extension AddTaskViewController: AddTaskViewDelegate{
    func addTask(_ task: TaskModel) {
        self.taskService.saveTask(task, in: taskListModel)
        dismiss(animated: true)
    }
}
