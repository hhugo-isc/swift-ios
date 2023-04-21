//
//  AddListViewController.swift
//  MVC-TodoApp
//
//  Created by administrador on 20/04/23.
//

import Foundation
import UIKit

class AddListViewController: UIViewController{
    
    private var addListView = AddListView()
    private var taskListService: TaskListServiceProtocol!
    
    init(taskListService: TaskListServiceProtocol!) {
        super.init(nibName: nil, bundle: nil)
        self.taskListService = taskListService
    }

    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    override func loadView() {
        super.loadView()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        setupAddListView()
    }
    
    private func setupAddListView(){
        addListView.delegate = self
        self.view = addListView
    }
    
    private func backToHome(){
        self.navigationController?.popViewController(animated: true)
    }
}


extension AddListViewController: AddListViewDelegate{
    func addList(_ list: TaskListModel) {
        self.taskListService.saveTasksList(list)
        self.backToHome()
    }
}

extension AddListViewController: BackButtonDelegate{
    func navigateBack() {
        self.backToHome()
    }
}
