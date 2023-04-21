//
//  FieldLabel.swift
//  MVC-TodoApp
//
//  Created by administrador on 19/04/23.
//

import Foundation
import UIKit

class FieldLabel: UILabel{
    required init(title:String){
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .left
        font = .systemFont(ofSize: 21, weight: .light)
        textColor = .grayTextColor
        text = title
    }
    
    required init?(coder: NSCoder){
        fatalError("")
    }
}
