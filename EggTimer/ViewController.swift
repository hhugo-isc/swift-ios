//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    private let eggTimes: [String: Int] = ["Soft":4,"Medium":7,  "Hard":10]
    
    private var timer: Timer = Timer()
    private var secondsPassed: Int = 0
    private var totalTime: Int = 0
    
    @IBAction func harndessSelected(_ sender: UIButton) {
        
        self.titleLabel.text = "Cooking..."
        self.secondsPassed = 0
        self.totalTime = eggTimes[sender.currentTitle!]!
        
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
    }
    
    @objc func timerFunction(){
        if secondsPassed < totalTime {
            secondsPassed += 1
            self.progressBar.progress = Float(secondsPassed)/Float(totalTime)
        }else{
            timer.invalidate()
            titleLabel.text = "Done!"
        }
    }
    

}
