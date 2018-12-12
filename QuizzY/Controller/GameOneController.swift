//
//  Game1View.swift
//  QuizzY
//
//  Created by Nils Toularastel on 07/12/2018.
//  Copyright © 2018 Johan Maille--Guilloux. All rights reserved.
//

import UIKit

class GameOneController: UIViewController {
   
    var timer = Timer()
    var game: Game? = nil
    
    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet var answers: [UIButton]!
    @IBOutlet weak var viewTitle: UINavigationItem!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toggleEnableAnswers()
        startGame()
    }
    
    func defautcolor(){
        for button in answers{
            button.backgroundColor = UIColor(red: 191.0/255.0, green: 196.0/255.0, blue: 201.0/255.0, alpha: 1) // Gris
            button.setTitleColor( UIColor.gray,for: UIControlState.disabled)
        }
    }
   
    func set(index:Int){
        for button in answers{
            button.backgroundColor = UIColor(red: 243.0/255.0, green: 135.0/255.0, blue: 148.0/255.0, alpha: 1) // Rouge
        }
        answers[index].backgroundColor = UIColor(red: 200.0/255.0, green: 236.0/255.0, blue: 160.0/255.0, alpha: 1) // Vert
        answers[index].setTitleColor( UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1),for: UIControlState.disabled)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didChooseAnswer(_ sender: Any) {
        if let clickedButton = sender as? UIButton {
            var functionSelector: Selector
            toggleEnableAnswers()
            set(index: findButton(titleButton: game!.currentQuestion.name))
            game!.answer(with: clickedButton.title(for: .normal)!)
            scoreLabel.text = "\(game!.score) / \(game!.questions.count)"
            if game!.state == .ongoing {
                functionSelector = #selector(self.loadQuestion)
            } else {
                functionSelector = #selector(self.gameOver)
            }
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: functionSelector, userInfo: nil, repeats: false)
            
            //loadQuestion()
        }
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
    
    func setLabelAnswers(arrAnswer: [String]) {
        for (index, answer) in answers.enumerated() {
            answer.setTitle(arrAnswer[index], for: .normal)
        }
    }
    
    private func findButton(titleButton: String) -> Int {
        for (index, button) in answers.enumerated() {
            if button.title(for: .normal) == titleButton {
                return index
            }
        }
        
        return -1
    }
    
    private func startGame() {
        loader.isHidden = false
        toggleHideAnswers()
        
        game!.questions = QuestionManager.shared.questions
        game!.randomize()
        loadQuestion()
        
        toggleHideAnswers()
        loader.isHidden = true
    }
    
    @objc private func loadQuestion() {
        defautcolor()
        toggleEnableAnswers()
        scoreLabel.text = "\(game!.score) / \(game!.questions.count)"
        image.image = UIImage(named: game!.currentQuestion.imagePath)
        viewTitle.title = "Question N°"+game!.indexQuestion()
        setLabelAnswers(arrAnswer: game!.getAnswersList())
        defautcolor()
    }
    
    @objc func questionLoaded() {
        loader.isHidden = true
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
