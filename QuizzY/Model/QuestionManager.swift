//
//  QuestionManager.swift
//  QuizzY
//
//  Created by Nils Toularastel on 03/12/2018.
//  Copyright © 2018 Johan Maille--Guilloux. All rights reserved.
//

import Foundation
import UIKit

class QuestionManager {
    
    static let shared = QuestionManager()
    private init() {}
    
    var questions: [Question] {
        return [Question(imagePath: "statue liberte", name: "Statue de la Liberté"),
                     Question(imagePath: "tour eiffel", name: "Tour Eiffel"),
                     Question(imagePath: "taj mahal", name: "Taj Mahal"),
                     Question(imagePath: "kremlin", name: "Kremlin"),
                     Question(imagePath: "notre dame paris", name: "Notre-Dame de Paris")]        
    }
    
}
