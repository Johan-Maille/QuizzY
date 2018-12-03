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
    enum Difficulty {
        case easy, medium, hard
    }
    
    private var currentIndex: Int = 0
    var state: State = .ongoing
    var gameMod: Mod = .text
    var score: Int = 0
    var questions: [Question] = []
    var percentage: Float = 1.0
    var questionCount: Int = 0
    
    var currentQuestion: Question {
        return questions[currentIndex]
    }
    
    func answerText(with answer: String) {
        var questionIsDone: Bool = false
        
        switch gameMod {
            case .text:
                if answer == currentQuestion.name {
                    score += 1
                }
            
                questionIsDone = (percentage >= 80)
            
            case .image:
                if answer == currentQuestion.imageName {
                    score += 1
                }
                
                questionIsDone = true
        }
        
        if questionIsDone {
            if currentIndex > questionCount {
                state = .over
            } else {
                currentIndex += 1
            }
        }
    }
}
