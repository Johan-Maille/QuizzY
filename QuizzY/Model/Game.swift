//
//  Game.swift
//  QuizzY
//
//  Created by Nils Toularastel on 03/12/2018.
//  Copyright © 2018 Johan Maille--Guilloux. All rights reserved.
//

import Foundation

class Game {
    enum State {
        case ongoing, over
    }
    enum Mod {
        case text, image
    }
    
    private var currentIndex: Int = 0
    var state: State = .ongoing
    var mod: Mod = .text
    var score: Int = 0
    var tests: [Test] = []
    
    var currentTest: Test {
        return tests[currentIndex]
    }
    
    func answerText(with answer: String) {
        if answer == currentTest.name{
            score += 1
        }
        
        if currentIndex >= tests.count-1 {
            state = .over
        } else {
            currentIndex += 1
        }
    }
}
