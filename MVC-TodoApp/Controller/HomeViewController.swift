//
//  HomeViewController.swift
//  MVC-TodoApp
//
//  Created by administrador on 17/04/23.
//

import Foundation
import UIKit

class HomeViewController: UIViewController{
    
    private var homeView = HomeView()
    private var taskListService: TaskListServiceProtocol!
    private var taskService: TaskServiceProtocol!
    
    init(taskListService: TaskListServiceProtocol, taskService: TaskServiceProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.taskListService = taskListService
        self.taskService = taskService
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        setupHomeView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(contextObjectsDidChange), name: NSNotification.Name.NSManagedObjectContextObjectsDidChange, object: CoreDataManager.shared.mainContext)
    }
    
    func setupHomeView(){
        homeView.delegate = self
        fetchTasksList()
        self.view = homeView
    }
    
}

extension HomeViewController{
    @objc func contextObjectsDidChange(){
        fetchTasksList()
    }
    
    func fetchTasksList(){
        let lists = taskListService.fetchLists()
        homeView.setTaskLists(lists)
    }
}


extension HomeViewController: HomeViewDelegate{
    func addListAction() {
        let addListViewController = AddListViewController(taskListService: self.taskListService)
        navigationController?.pushViewController(addListViewController, animated: true)
    }
    
    func selectedList(_ list: TaskListModel) {
        let taskViewController = TaskListViewController(taskListModel: list, taskListService: taskListService, taskService: taskService)
        self.navigationController?.pushViewController(taskViewController, animated: true)
    }
    
    func deleteList(_ list: TaskListModel) {
        self.taskListService.deleteList(list)
    }
}
