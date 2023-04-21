//
//  TodoListCell.swift
//  MVC-TodoApp
//
//  Created by administrador on 18/04/23.
//

import Foundation
import UIKit

class TodoListCell: UITableViewCell{
    
    static let reuseId = "TodoListCell"
    
    private(set) var title: String!
    private(set) var icon: String!
    private(set) var numberOfTasks: Int!
    
    private var container = UIView(frame: .zero)
    private var iconView = UIImageView(frame: .zero)
    private var titleLabel = UILabel(frame: .zero)
    private var taskLabel = UILabel(frame: .zero)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        setContainer()
        setIcon()
        setTitleLabel()
        setTaskLabel()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    func setCellParameterForList(_ taskList: TaskListModel){
        let image = UIImage(systemName: taskList.icon)?
            .withTintColor(.mainBlueColor, renderingMode: .alwaysOriginal)
            .withConfiguration(UIImage.SymbolConfiguration(pointSize: 35.0))
        
        iconView.image = image
        titleLabel.text = taskList.title
        taskLabel.text = "\(taskList.tasks.count) Tasks"
    }
    
}

extension TodoListCell{
    func setContainer(){
        container.backgroundColor = .white
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .mainBlueBackgroundColor
        container.layer.cornerRadius = 10
        contentView.addSubview(container)
        
        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2),
        ])
    }
    
    func setIcon(){
        
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.contentMode = .center
        container.addSubview(iconView)
        
        NSLayoutConstraint.activate([
            iconView.topAnchor.constraint(equalTo: container.topAnchor, constant: 5),
            iconView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
            iconView.heightAnchor.constraint(equalToConstant: 50),
            iconView.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    func setTitleLabel(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .darkGray
        titleLabel.font = .systemFont(ofSize: 20, weight: .light)
        titleLabel.numberOfLines = 3
        titleLabel.lineBreakMode = .byTruncatingTail
        container.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            titleLabel.centerYAnchor.constraint(equalTo: container.centerYAnchor)
        ])
    }
    
    func setTaskLabel(){
        taskLabel.translatesAutoresizingMaskIntoConstraints = false
        taskLabel.textColor = .mainBlueColor
        taskLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        taskLabel.numberOfLines = 1
        taskLabel.textAlignment = .center
        taskLabel.lineBreakMode = .byTruncatingTail
        container.addSubview(taskLabel)
        
        NSLayoutConstraint.activate([
            taskLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            taskLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -10),
            taskLabel.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
}
