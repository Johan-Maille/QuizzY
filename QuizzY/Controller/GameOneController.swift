//
//  Game1View.swift
//  QuizzY
//
//  Created by Nils Toularastel on 07/12/2018.
//  Copyright © 2018 Johan Maille--Guilloux. All rights reserved.
//

import UIKit

class GameOneController: UIViewController {
   
    var game: Game? = nil
    var questions: [Question] = [Question(imagePath: "statue liberte", name: "Statue de la Liberté"),
                                 Question(imagePath: "tour eiffel", name: "Tour Eiffel"),
                                 Question(imagePath: "taj mahal", name: "Taj Mahal"),
                                 Question(imagePath: "kremlin", name: "Kremlin"),
                                 Question(imagePath: "notre dame paris", name: "Notre-Dame de Paris")]
    
    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet var answers: [UIButton]!
    @IBOutlet weak var viewTitle: UINavigationItem!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startGame()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didChooseAnswer(_ sender: Any) {
        if let clickedButton = sender as? UIButton {
            game!.answer(with: clickedButton.title(for: .normal)!)
            scoreLabel.text = "\(game!.score) / \(game!.questions.count)"
            loadQuestion()
        }
    }
    
    func toggleHideAnswers() {
        for answer in answers {
            answer.isHidden = !answer.isHidden
        }
    }
    
    func setLabelAnswers(arrAnswer: [String]) {
        for (index, answer) in answers.enumerated() {
            answer.setTitle(arrAnswer[index], for: .normal)
        }
    }
    
    private func startGame() {
        loader.isHidden = false
        toggleHideAnswers()
        
        game!.questions = questions
        game!.randomArr()
        loadQuestion()
        
        toggleHideAnswers()
        loader.isHidden = true
    }
    
    private func loadQuestion() {
        scoreLabel.text = "\(game!.score) / \(game!.questions.count)"
        image.image = UIImage(named: game!.currentQuestion.imagePath)
        viewTitle.title = "Question N°"+game!.indexQuestion()
        setLabelAnswers(arrAnswer: game!.getAnswersList())
    }
    
}
