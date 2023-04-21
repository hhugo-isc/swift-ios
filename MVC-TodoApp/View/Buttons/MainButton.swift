//
//  MainButton.swift
//  MVC-TodoApp
//
//  Created by administrador on 18/04/23.
//

import Foundation
import UIKit

class MainButton: UIButton{
    
    required init(title: String, color: UIColor) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        backgroundColor = color
        setTitle(title, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 28, weight: .light)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
