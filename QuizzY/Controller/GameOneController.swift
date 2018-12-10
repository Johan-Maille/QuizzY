//
//  Game1View.swift
//  QuizzY
//
//  Created by Nils Toularastel on 07/12/2018.
//  Copyright © 2018 Johan Maille--Guilloux. All rights reserved.
//

import UIKit

class GameOneController: UIViewController {
     @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
   
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
    
    func defautcolor(){
        for button in answers{
            button.backgroundColor = UIColor(red: 191.0/255.0, green: 196.0/255.0, blue: 201.0/255.0, alpha: 1) // Gris
        }
    }
   
    func set(index:Int){
        for button in answers{
            button.backgroundColor = UIColor(red: 243.0/255.0, green: 135.0/255.0, blue: 148.0/255.0, alpha: 1) // Rouge
        }
        answers[index].backgroundColor = UIColor(red: 200.0/255.0, green: 236.0/255.0, blue: 160.0/255.0, alpha: 1) // Vert
        answers[index].setTitleColor( UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1),for: UIControlState.disabled)
        
    }
    
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
            toggleEnableAnswers()
            set(index: findButton(titleButton: game!.currentQuestion.name))
            game!.answer(with: clickedButton.title(for: .normal)!)
            scoreLabel.text = "\(game!.score) / \(game!.questions.count)"
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
    private func findButton(titleButton: String) -> Int{
        for(index , button)in answers.enumerated(){
            if button.title(for: .normal) == titleButton{
                return index
            }
        }
        return -1
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
        defautcolor()
    }
    
    @objc func questionLoaded() {
        loader.isHidden = true
//        newGameButton.isHidden = false
//        question.title = game.currentQuestion.title
    }
}
