//
//  Adventure.swift
//  InteractiveStory
//
//  Created by Samuel Yanez on 11/27/17.
//  Copyright © 2017 Samuel Yanez. All rights reserved.
//

import Foundation

struct Adventure {
    static func story(withName name: String) -> Page {
        let returnTrip = Page(story: .returnTrip(name: name))
        let touchdown = returnTrip.addChoiceWith(title: "Stop and Investigate", story: .touchDown)
        let homeward = returnTrip.addChoiceWith(title: "Continue home to Earth", story: .homeward)
        let rover = touchdown.addChoiceWith(title: "Explore the Rover", story: .rover(name: name))
        let crate = touchdown.addChoiceWith(title: "Open the Crate", story: .crate)
        
        let _ = homeward.addChoiceWith(title: "Head back to Mars", page: touchdown)
        let home = homeward.addChoiceWith(title: "Continue Home to Earth", story: .home)
        
        let cave = rover.addChoiceWith(title: "Explore the Coordinates", story: .cave)
        let _ = rover.addChoiceWith(title: "Return to Earth", page: home)
        
        let _ = cave.addChoiceWith(title: "Continue towards faint light", story: .droid(name: name))
        let _ = cave.addChoiceWith(title: "Refill the ship and explore the rover", page: rover)
        
        let _ = crate.addChoiceWith(title: "Explore the Rover", page: rover)
        
        let _ = crate.addChoiceWith(title: "Use the key", story: .monster)
        
        return returnTrip
    }
}
