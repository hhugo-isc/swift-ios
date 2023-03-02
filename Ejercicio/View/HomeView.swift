//
//  HomeView.swift
//  Ejercicio
//
//  Created by administrador on 02/03/23.
//

import Foundation
import UIKit

class HomeView: UIViewController{
    
    var email: String!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailLabel.text = self.emailLabel.text! + " " + email
    }
}
