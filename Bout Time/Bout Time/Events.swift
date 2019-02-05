//
//  Events.swift
//  Bout Time
//
//  Created by James Garcia-Bengochea on 1/7/19.
//  Copyright © 2019 James Garcia-Bengochea. All rights reserved.
//

class Event {
    let eventName: String
    let eventYear: Int
    
    init(eventName: String, eventYear: Int) {
        self.eventName = eventName
        self.eventYear = eventYear
    }
}


let event1 = Event.init(eventName: "Martin Luther King Jr.’s 'I have a dream' speech", eventYear: 1963)
let event2 = Event.init(eventName: "Titanic is sunk", eventYear: 1912)
let event3 = Event.init(eventName: "Filming the MGM Lion", eventYear: 1929)
let event4 = Event.init(eventName: "The Tank Man in Tiananmen Square, China.", eventYear: 1989)
let event5 = Event.init(eventName: "Wilbur Wright flies around the Statue of Liberty", eventYear: 1909)
let event6 = Event.init(eventName: "Kennedy-Nixon Presidential Debate", eventYear: 1960)
let event7 = Event.init(eventName: "Victory over Japan Day", eventYear: 1945)
let event8 = Event.init(eventName: "Hollywood sign is built", eventYear: 1923)
let event9 = Event.init(eventName: "Hoover dam opens", eventYear: 1936)
let event10 = Event.init(eventName: "Neil Armstrong walks on the moon", eventYear: 1969)
let event11 = Event.init(eventName: "Signing of the Treaty of Versailles", eventYear: 1919)
let event12 = Event.init(eventName: "First Woodstock Music Festival", eventYear: 1969)
let event13 = Event.init(eventName: "Berlin wall destroyed", eventYear: 1991)
let event14 = Event.init(eventName: "Transcontinental Railroad is completed", eventYear: 1869)
let event15 = Event.init(eventName: "Assassination of Abraham Lincoln", eventYear: 1865)
let event16 = Event.init(eventName: "Death of Osama bin Laden", eventYear: 2011)
let event17 = Event.init(eventName: "Assassination of John F. Kennedy", eventYear: 1963)
let event18 = Event.init(eventName: "World wide web goes live", eventYear: 1991)
let event19 = Event.init(eventName: "Cuban missile crisis", eventYear: 1962)
let event20 = Event.init(eventName: "Nelson Mandela released from prison", eventYear: 1990)
let event21 = Event.init(eventName: "Watergate Scandal", eventYear: 1972)
let event22 = Event.init(eventName: "Suzanne Lenglen Breaks Wimbledon Record", eventYear: 1925)
let event23 = Event.init(eventName: "Charles Lindbergh Flies the Atlantic Solo", eventYear: 1927)
let event24 = Event.init(eventName: "Hindenburg Airship Crash", eventYear: 1937)
let event25 = Event.init(eventName: "Roger Bannister breaks the 4 minute mile", eventYear: 1954)

let eventPool: [Event] = [event1, event2, event3, event4, event5, event6, event7, event8, event9, event10, event11, event12, event13, event14, event15, event16, event17, event18, event19, event20, event21, event22, event23, event24, event25]


