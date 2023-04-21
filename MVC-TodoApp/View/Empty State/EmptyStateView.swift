//
//  EmptyStateView.swift
//  MVC-TodoApp
//
//  Created by administrador on 18/04/23.
//

import Foundation
import UIKit

class EmptyStateView: UIView{
    
    var imageView = UIImageView(frame: .zero)
    var titleLabel = UILabel(frame: .zero)
    
    required init(frame: CGRect, title: String) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        
        configureImageView()
        configureTitleLabelWithText(title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
}

extension EmptyStateView{
    func configureImageView(){
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .center
        imageView.image = UIImage(systemName: "list.bullet.rectangle.portrait")?
            .withTintColor(.grayTextColor, renderingMode: .alwaysOriginal)
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -100),
            imageView.widthAnchor.constraint(equalToConstant: 150),
            imageView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func configureTitleLabelWithText(_ text: String){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 24, weight: .light)
        titleLabel.textColor = .grayTextColor
        titleLabel.text = text
        titleLabel.numberOfLines = 0
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20)
        ])
    }
}
