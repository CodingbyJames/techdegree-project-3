//
//  EventManager.swift
//  Bout Time
//
//  Created by James Garcia-Bengochea on 1/7/19.
//  Copyright © 2019 James Garcia-Bengochea. All rights reserved.
//

import GameplayKit

class EventGenerator {
    var roundEvents: [Event] = []
    func createRoundEventPool() {
        var totalEventPool: [Event] = eventPool
        for _ in 1...4 {
            let index = GKRandomSource.sharedRandom().nextInt(upperBound: totalEventPool.count)
            roundEvents.append(totalEventPool[index])
            totalEventPool.remove(at: index)
        }
    }
    
    init() {
        
    }
}


let eventGenerator = EventGenerator()

