//
//  ViewController.swift
//  Bout Time
//
//  Created by James Garcia-Bengochea on 1/7/19.
//  Copyright © 2019 James Garcia-Bengochea. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    let roundsPerGame = 6
    var rounds = 0
    var correctRounds = 0
    var counter: Int = 60
    var timerClock = Timer()
    
    // MARK: - Outlets
    @IBOutlet weak var Event0: UILabel!
    @IBOutlet weak var Event1: UILabel!
    @IBOutlet weak var Event2: UILabel!
    @IBOutlet weak var Event3: UILabel!
    @IBOutlet weak var timer: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        eventGenerator.createRoundEventPool()
        startTimer()
        
        
    }
    func startTimer() {
        timerClock = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    @objc func updateTimer() {
        if counter > 0 {
            counter -= 1
            timer.text = timeFormatted(counter)
        }
        else {
            //Run end round function
            resetTimer()
        }
    }
    func resetTimer () {
        timerClock.invalidate()
        counter = 60
        timer.text = timeFormatted(counter)
        timerClock = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    func timeFormatted(_ counter: Int) -> String {
        let seconds: Int = counter % 60
        return String(format: "0:%02d", seconds)
    }
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

