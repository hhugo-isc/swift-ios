//
//  PageLabel.swift
//  MVC-TodoApp
//
//  Created by administrador on 19/04/23.
//

import Foundation
import UIKit

class PageLabel: UILabel{
    
    override init(frame: CGRect){
        super.init(frame: frame)
        configure()
    }
    
    required init(title: String) {
        super.init(frame: .zero)
        configure()
        setTitle(title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(){
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .center
        font = .systemFont(ofSize: 40, weight: .light)
        textColor = .grayTextColor
    }
    
    func setTitle(_ title: String){
        text = title
    }
}


