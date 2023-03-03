//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var quuestionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    
    private let quizzController: QuizzController = QuizzController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.scoreLabel.text = "Score: \(quizzController.getScore())"
        self.quuestionLabel.text = self.quizzController.getCuestion()
        self.progressBar.progress = self.quizzController.getProgress()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let isAnswerCorrect = quizzController.isUserAnswerCorrect(userAnswer: sender.currentTitle!)
        
        if isAnswerCorrect {
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        quizzController.nextCuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI(){
        self.scoreLabel.text = "Score: \(quizzController.getScore())"
        self.quuestionLabel.text = self.quizzController.getCuestion()
        self.progressBar.progress = self.quizzController.getProgress()
        self.trueButton.backgroundColor = UIColor.clear
        self.falseButton.backgroundColor = UIColor.clear
    }


}

