//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes = [ "Soft": 3, "Medium": 480, "Hard": 720 ]
    var counter: Float = 0.0
    var totalTime:Float = 0.0
    var timer = Timer()
    
    var player: AVAudioPlayer!
    
    @IBOutlet weak var changeTitle: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelector(_ sender: UIButton) {
        timer.invalidate()
        progressBar.progress = 0.0
        counter = 0.0
        
        changeTitle.text = sender.currentTitle!
        let hardness = sender.currentTitle! // soft, medium, hard
        
        totalTime = Float(eggTimes[hardness]!)
        
        // selector calls the function every second
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    // selectors come from objc
    @objc func updateTimer() {
        if counter < totalTime {
            counter += 1
            progressBar.progress = counter/totalTime
        } else {
            timer.invalidate()
            changeTitle.text = "DONE!"
            playSound(sound: "alarm_sound")
        }
    }
    
    func playSound(sound: String) {
        let url = Bundle.main.url(forResource: sound, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
}
