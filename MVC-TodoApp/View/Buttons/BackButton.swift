//
//  BackButton.swift
//  MVC-TodoApp
//
//  Created by administrador on 18/04/23.
//

import Foundation
import UIKit

protocol BackButtonDelegate: AnyObject{
    func navigateBack()
}

class BackButton: UIButton{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(systemName: "arrow.backward.circle")?
            .withTintColor(.darkGray, renderingMode: .alwaysOriginal)
            .withConfiguration(UIImage.SymbolConfiguration(pointSize: 35.0))
        
        setImage(image, for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
