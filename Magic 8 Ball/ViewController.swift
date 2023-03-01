//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Angela Yu on 14/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad(){
        super.viewDidLoad()
        imageView.image = ballArray[3]
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    let ballArray = [#imageLiteral(resourceName: "ball1.png"),#imageLiteral(resourceName: "ball2.png"),#imageLiteral(resourceName: "ball3.png"),#imageLiteral(resourceName: "ball4.png"),#imageLiteral(resourceName: "ball5.png")]


    @IBOutlet weak var askButtomPressed: UIButton!
    

    @IBAction func askButtomPressed(_ sender: UIButton) {
        self.imageView.image = ballArray.randomElement()
    }
}

