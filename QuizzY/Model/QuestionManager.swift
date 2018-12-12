//
//  QuestionManager.swift
//  QuizzY
//
//  Created by Nils Toularastel on 03/12/2018.
//  Copyright © 2018 Johan Maille--Guilloux. All rights reserved.
//

import Foundation
import UIKit


// Classe qui gére les données questions
class QuestionManager {
    
    static let shared = QuestionManager()
    private init() {}
    
    // Les questions disponible
    var questions: [Question] = [Question(imagePath: "statue liberte", name: "Statue de la Liberté"),
                                 Question(imagePath: "tour eiffel", name: "Tour Eiffel"),
                                 Question(imagePath: "taj mahal", name: "Taj Mahal"),
                                 Question(imagePath: "kremlin", name: "Kremlin"),
                                 Question(imagePath: "notre dame paris", name: "Notre-Dame de Paris"),
                                 Question(imagePath: "grande muraille", name: "La grande muraille"),
                                 Question(imagePath: "christ redempteur", name: "Christ rédempteur"),
                                 Question(imagePath: "collisee", name: "Le Colisée"),
                                 Question(imagePath: "stonehenge", name: "Stonehenge"),
                                 Question(imagePath: "mont saint michel", name: "Mont-Saint-Michel"),
                                 Question(imagePath: "chateau vizille", name: "Chateau de Vizille"),
                                 Question(imagePath: "acropole", name: "Acropole"),
                                 Question(imagePath: "tour pise", name: "Tour de Pise"),
                                 Question(imagePath: "bigben", name: "Big Ben"),
                                 Question(imagePath: "musee louvre", name: "Le musée du Louvre")]
    
    // Renvoie le nombre de question aléatoire voulu
    func get(questionCount: Int) -> [Question] {
        var resArr: [Question] = []
        var arrIndex: [Int: Int] = [:]
        
        while resArr.count < questionCount {
            let rand = randomInt(min: 0, max: questions.count-1)
            if arrIndex[rand] == nil {
                resArr.append(questions[rand])
                arrIndex[rand] = rand
            }
        }
        
        return resArr
    }
    
    // Renvoie entier aléatoire entre les bornes données
    func randomInt(min: Int, max: Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
    
}
