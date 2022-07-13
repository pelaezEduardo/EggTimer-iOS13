//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = [ "Soft": 300, "Medium": 480, "Hard": 720 ]
    var counter = 60
    var timer = Timer()
    
    @IBOutlet weak var changeTitle: UILabel!
    
    @IBAction func hardnessSelector(_ sender: UIButton) {
        timer.invalidate()
        
        let hardness = sender.currentTitle! // soft, medium, hard
        
        counter = eggTimes[hardness]!
        
        // selector calls the function every second
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    // selectors come from objc
    @objc func updateTimer() {
        if counter > 0 {
            print("\(counter)")
            counter -= 1
        } else {
            timer.invalidate()
            changeTitle.text = "done!"
        }
    }
    
}
