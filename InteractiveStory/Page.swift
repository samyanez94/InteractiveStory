//
//  Page.swift
//  InteractiveStory
//
//  Created by Samuel Yanez on 11/27/17.
//  Copyright © 2017 Samuel Yanez. All rights reserved.
//

import Foundation

enum AdventureError: Error {
    case nameNotProvided
}

class Page {
    let story: Story
    
    typealias Choice = (title: String, page: Page)
    
    var firstChoice: Choice?
    var secondChoice: Choice?
    
    init(story: Story) {
        self.story = story
    }
}

extension Page {
    
    func addChoiceWith(title: String, story: Story) -> Page {
        let page = Page(story: story)
        return addChoiceWith(title: title, page: page)
    }
    
    func addChoiceWith(title: String, page: Page) -> Page {
        switch (firstChoice, secondChoice) {
        case (.some, .some): return self
        case (.some, .none): secondChoice = (title, page)
        case (.none, .none), (.none, .some): firstChoice = (title, page)
        }
        return page
    }
}
