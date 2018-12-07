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
        case text, pictures, random
    }
    
    enum Difficulty {
        case easy, medium, hard
    }
    
    private var currentIndex: Int = 0
    var state: State = .over
    var gameMod: Mod = .text
    var score: Int = 0
    var questions: [Question] = []
    var percentage: Float = 1.0
    var questionCount: Int = 0
    var difficult: Difficulty = .easy
    
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
            
            case .pictures:
                if answer == currentQuestion.imageName {
                    score += 1
                }
                
                questionIsDone = true
            
            case .random:
                print("random mod")
            
        }
        
        if questionIsDone {
            if currentIndex > questionCount {
                state = .over
            } else {
                currentIndex += 1
            }
        }
    }
    
    func setGameMod(jeu: String) {
        switch jeu {
            case "game1":
                self.gameMod = .text
            
            case "game2":
                self.gameMod = .pictures
            
            case "game3":
                self.gameMod = .random
            
            default:
                print("Error : unknown gamemod")
            
        }
    }
    
    func setDifficult(difficulty: String) {
        switch difficulty {
            case "easy":
                self.difficult = .easy
            
            case "medium":
                self.difficult = .medium
            
            case "hard":
                self.difficult = .hard
            
            default:
                print("Error : unknown difficult")
            
        }
    }
    
    func toString() -> String {
        var mod: String = "Mode : "
        var difficulty: String = "Difficulté : "
        
        switch gameMod {
            case .text:
                mod += "Text"
            
            case .pictures:
                mod += "Photo"
            
            case .random:
                mod += "Random"
        }
        
        switch difficult {
            case .easy:
                difficulty += "Facile"
            
            case .medium:
                difficulty += "Moyen"
            
            case .hard:
                difficulty += "Difficile"
        }
        
        return mod+"\n"+difficulty
    }
}
