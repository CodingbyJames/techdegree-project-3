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
    
    // MARK: - Outlets
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        eventGenerator.createRoundEventPool()
        
    }
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

