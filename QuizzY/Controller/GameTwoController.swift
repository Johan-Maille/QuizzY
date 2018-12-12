//
//  GameTwoController.swift
//  QuizzY
//
//  Created by Nils Toularastel on 07/12/2018.
//  Copyright © 2018 Johan Maille--Guilloux. All rights reserved.
//

import UIKit

class GameTwoController: UIViewController {
    
    var game: Game? = nil
    var timer = Timer()

    @IBOutlet var answers: [UIButton]!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var viewTitle: UINavigationItem!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var goodImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toggleEnableAnswers()
        startGame()
    }
    
    @IBAction func didChooseAnswer(_ sender: UIButton) {
        var functionSelector: Selector
        toggleEnableAnswers()
        
        game!.answer(with: sender.accessibilityIdentifier!)
        scoreLabel.text = "\(game!.score) / \(game!.questions.count)"
        if game!.state == .ongoing {
            functionSelector = #selector(self.loadQuestion)
        } else {
            functionSelector = #selector(self.gameOver)
        }
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: functionSelector, userInfo: nil, repeats: false)
        
        //loadQuestion()
    }
    
    func toggleHideAnswers() {
        for answer in answers {
            answer.isHidden = !answer.isHidden
        }
    }
    func toggleEnableAnswers() {
        for answer in answers {
            answer.isEnabled = !answer.isEnabled
        }
    }
    
    func setImageAnswers(arrAnswer: [String]) {
        for (index, answer) in answers.enumerated() {
            answer.setImage(UIImage(named: arrAnswer[index]), for: .normal)
            answer.accessibilityIdentifier = arrAnswer[index]
        }
    }
    
    private func findButton(imageButton: UIImage) -> Int {
        for (index, button) in answers.enumerated() {
            if button.currentBackgroundImage == imageButton {
                return index
            }
        }
        
        return -1
    }
    
    private func startGame() {
//        loader.isHidden = false
        toggleHideAnswers()
        
        game!.questions = QuestionManager.shared.questions
        game!.randomize()
        loadQuestion()
        
        toggleHideAnswers()
//        loader.isHidden = true
    }
    
    @objc private func loadQuestion() {
        toggleEnableAnswers()
        scoreLabel.text = "\(game!.score) / \(game!.questions.count)"
        questionLabel.text = game!.currentQuestion.name
        viewTitle.title = "Question N°"+game!.indexQuestion()
        setImageAnswers(arrAnswer: game!.getAnswersList())
    }
    
    @objc func questionLoaded() {
//        loader.isHidden = true
        //        newGameButton.isHidden = false
        //        question.title = game.currentQuestion.title
    }
    
    @objc func gameOver() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EndGameOne") as! EndGameOneController
        
        nextViewController.game = game
        self.present(nextViewController, animated: true, completion: nil)
    }
}
