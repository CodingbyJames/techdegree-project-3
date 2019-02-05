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
    @IBOutlet weak var btnSuccess: RoundButton!
    @IBOutlet weak var btnFailure: RoundButton!
    @IBOutlet weak var finalScore: UILabel!
    @IBOutlet weak var playAgainBtn: UIButton!
    @IBOutlet weak var shake: UILabel!
    @IBOutlet weak var button0Down: UIButton!
    @IBOutlet weak var button1Up: UIButton!
    @IBOutlet weak var button1Down: UIButton!
    @IBOutlet weak var button2Up: UIButton!
    @IBOutlet weak var button2Down: UIButton!
    @IBOutlet weak var button3Up: UIButton!
    
    // MARK: - Actions
    @IBAction func button0Down(_ sender: UIButton) {
        buttonDown(sender)
    }
    @IBAction func button1Up(_ sender: UIButton) {
        buttonUp(sender)
    }
    @IBAction func button1Down(_ sender: UIButton) {
        buttonDown(sender)
    }
    @IBAction func button2Up(_ sender: UIButton) {
        buttonUp(sender)
    }
    @IBAction func button2Down(_ sender: UIButton) {
        buttonDown(sender)
    }
    @IBAction func button3Up(_ sender: UIButton) {
        buttonUp(sender)
    }
    @IBAction func success(_ sender: Any) {
        roundStart()
    }
    @IBAction func failure(_ sender: Any) {
        roundStart()
    }
    @IBAction func playAgain(_ sender: Any) {
        rounds = 0
        correctRounds = 0
        roundStart()
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.becomeFirstResponder()
        roundStart()
        
        
        
    }
    override var canBecomeFirstResponder: Bool {
        get {
            return true
        }
    }
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            roundEnd()
        }
    }
    func startTimer() {
        timerClock = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    @objc func updateTimer() {
        if counter != 0 {
            counter -= 1
            timer.text = timeFormatted(counter)
        }
        else {
            roundEnd()
        }
    }
    func resetTimer () {
        timerClock.invalidate()
        counter = 60
        timer.text = "1:00"
    }
    func timeFormatted(_ counter: Int) -> String {
        let seconds: Int = counter % 60
        return String(format: "0:%02d", seconds)
    }
    func roundStart() {
        btnFailure.isHidden = true
        btnSuccess.isHidden = true
        playAgainBtn.isHidden = true
        finalScore.isHidden = true
        timer.isHidden = false
        showEventsAndButtons()
        rounds += 1
        eventGenerator.createRoundEventPool()
        displayEvents()
        startTimer()
    }
    func displayEvents() {
        Event0.text = eventGenerator.roundEvents[0].eventName
        Event1.text = eventGenerator.roundEvents[1].eventName
        Event2.text = eventGenerator.roundEvents[2].eventName
        Event3.text = eventGenerator.roundEvents[3].eventName
    }
    func checkAnswers() {
        timer.isHidden = true
        shake.isHidden = true
        if rounds < roundsPerGame {
            
            if (eventGenerator.roundEvents[0].eventYear < eventGenerator.roundEvents[1].eventYear) && (eventGenerator.roundEvents[1].eventYear < eventGenerator.roundEvents[2].eventYear) && (eventGenerator.roundEvents[2].eventYear < eventGenerator.roundEvents[3].eventYear) {
                correctRounds += 1
                btnSuccess.isHidden = false
            }
            else {
                btnFailure.isHidden = false
            }
        }
        else {
            if (eventGenerator.roundEvents[0].eventYear < eventGenerator.roundEvents[1].eventYear) && (eventGenerator.roundEvents[1].eventYear < eventGenerator.roundEvents[2].eventYear) && (eventGenerator.roundEvents[2].eventYear < eventGenerator.roundEvents[3].eventYear) {
                correctRounds += 1
                endGame()
            }
            else {
                endGame()
            }
        }
    }
    func roundEnd() {
        checkAnswers()
        resetTimer()
    }
    func buttonUp(_ sender: UIButton) {
        if (sender.tag == 1) {
            eventGenerator.roundEvents.swapAt(sender.tag, (sender.tag - 1))
            displayEvents()
        }
        else if (sender.tag == 2) {
            eventGenerator.roundEvents.swapAt(sender.tag, (sender.tag - 1))
            displayEvents()
        }
        else {
            eventGenerator.roundEvents.swapAt(sender.tag, (sender.tag - 1))
            displayEvents()
        }
    }
    func buttonDown(_ sender: UIButton) {
        if (sender.tag == 0) {
            eventGenerator.roundEvents.swapAt(sender.tag, (sender.tag + 1))
            displayEvents()
        }
        else if (sender.tag == 1) {
            eventGenerator.roundEvents.swapAt(sender.tag, (sender.tag + 1))
            displayEvents()
        }
        else {
            eventGenerator.roundEvents.swapAt(sender.tag, (sender.tag + 1))
            displayEvents()
        }
    }
    func endGame() {
        hideEventsAndButtons()
        shake.isHidden = true
        finalScore.text = "Congrats! You got \(correctRounds)/6 rounds correct"
        finalScore.isHidden = false
        playAgainBtn.isHidden = false
    }
    func showEventsAndButtons() {
        Event0.isHidden = false
        Event1.isHidden = false
        Event2.isHidden = false
        Event3.isHidden = false
        button0Down.isHidden = false
        button1Down.isHidden = false
        button2Down.isHidden = false
        button1Up.isHidden = false
        button2Up.isHidden = false
        button3Up.isHidden = false
        shake.isHidden = false
    }
    func hideEventsAndButtons() {
        Event0.isHidden = true
        Event1.isHidden = true
        Event2.isHidden = true
        Event3.isHidden = true
        button0Down.isHidden = true
        button1Down.isHidden = true
        button2Down.isHidden = true
        button1Up.isHidden = true
        button2Up.isHidden = true
        button3Up.isHidden = true
        btnSuccess.isHidden = true
        btnFailure.isHidden = true
    }
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

