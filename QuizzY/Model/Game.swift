//
//  Game.swift
//  QuizzY
//
//  Created by Nils Toularastel on 03/12/2018.
//  Copyright © 2018 Johan Maille--Guilloux. All rights reserved.
//

import Foundation

// Classe qui permet de gérer le jeu
class Game {
    
    // Etats possible du jeu
    enum State {
        case ongoing, over
    }
    
    // Modes de jeu
    enum Mod {
        case text, pictures, random
    }
    
    // Difficulté possible du jeu
    enum Difficulty {
        case easy, medium, hard
    }
    
    private var currentIndex: Int = 0 // Indice courant
    var state: State = .ongoing // Etat courant
    var gameMod: Mod = .text // Mode courant
    var score: Int = 0 // Le score du joueur
    var questions: [Question] = [] // Les questions
    var percentage: Float = 1.0 // Pourcentage normalement utilsé pour le zoom du jeu 1
    var difficult: Difficulty = .easy // Difficulté courante
    var questionCount: Int = 5 // Nombre de question prévu
    
    // La question actuelle
    var currentQuestion: Question {
        return questions[currentIndex]
    }
    
    // Le pourcentage de réussite de la partie
    var questionPercentage: Float {
        return Float(score / questionCount)
    }
    
    // Fonction qui initialise pour le début de partie
    func start() {
        self.currentIndex = 0
        self.score = 0
        setQuestion()
        self.state = .ongoing
    }
    
    // Renvoi l'indice de la question courante
    func indexQuestion() -> String {
        let index = currentIndex+1
        return String(index)
    }
    
    // Remplie les questions
    func setQuestion() {
        self.questions = QuestionManager.shared.get(questionCount: questionCount)
    }
    
    // Fonction de réponse à la question
    func answer(with answer: String) {
        var questionIsDone: Bool = false
        
        switch gameMod {
            case .text:
                if answer == currentQuestion.name {
                    score += 1
                }
            
                questionIsDone = true
                //questionIsDone = (percentage >= 80)
            
            case .pictures:
                if answer == currentQuestion.imagePath {
                    score += 1
                }
                
                questionIsDone = true
            
            case .random:
                print("random mod")
            
        }
        
        if questionIsDone {
            if currentIndex >= questionCount-1 {
                state = .over
            } else {
                currentIndex += 1
            }
        }
    }
    
    // Change le mode de jeu
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
    
    // Change la difficulté
    func setDifficult(difficulty: String) {
        switch difficulty {
            case "easy":
                self.difficult = .easy
                self.questionCount = 5
            
            case "medium":
                self.difficult = .medium
                self.questionCount = 10
            
            case "hard":
                self.difficult = .hard
                self.questionCount = 15
            
            default:
                print("Error : unknown difficult")
            
        }
    }
    
    // Renvoie les propositions de réponses
    func getAnswersList() -> [String] {
        var arrAnswers: [String: Bool] = [:]
        var res: [String] = []
        
        if gameMod == .text {
            arrAnswers[currentQuestion.name] = true
            
            while arrAnswers.count < 4 {
                let rand = QuestionManager.shared.randomInt(min: 0, max: questions.count-1)
                if arrAnswers[questions[rand].name] == nil {
                    arrAnswers[questions[rand].name] = true
                }
            }
        } else {
            arrAnswers[currentQuestion.imagePath] = true
            
            while arrAnswers.count < 4 {
                let rand = QuestionManager.shared.randomInt(min: 0, max: questions.count-1)
                if arrAnswers[questions[rand].imagePath] == nil {
                    arrAnswers[questions[rand].imagePath] = true
                }
            }
        }
        
        for answer in arrAnswers {
            res.append(answer.key)
        }
        
        return res
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
