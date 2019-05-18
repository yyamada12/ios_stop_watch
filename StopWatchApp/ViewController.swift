//
//  ViewController.swift
//  StopWatchApp
//
//  Created by Yoshinobu Yamada on 2019/05/18.
//  Copyright © 2019 Yoshinobu Yamada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timerLabel: UILabel!
    
    var startTime: TimeInterval? = nil
    var timer = Timer()
    var elapsedTime = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @objc func update() {
        if let startTime = self.startTime {
            let t: Double = Date.timeIntervalSinceReferenceDate - startTime + elapsedTime
            let min = Int(t / 60)
            let sec = Int(t) % 60
            let msec = Int((t - Double(min * 60) - Double(sec)) * 100.0)
            self.timerLabel.text = String(format: "%02d:%02d:%02d", min, sec, msec)
        }
        
    }

    @IBAction func startTimer(_ sender: Any) {
        self.startTime = Date.timeIntervalSinceReferenceDate
        self.timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        
    }
    
    @IBAction func stopTimer(_ sender: Any) {
        if let startTime = self.startTime {
            self.elapsedTime += Date.timeIntervalSinceReferenceDate - startTime
        }
        self.timer.invalidate()
        
    }
    
    @IBAction func resetTimer(_ sender: Any) {
        self.startTime = nil
        self.elapsedTime = 0.0
        self.timerLabel.text = "00:00:00"
    }
}

