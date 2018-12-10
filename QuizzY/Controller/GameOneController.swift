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
    
    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var labelGoodAnswer: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet var answers: [UIButton]!
    @IBOutlet weak var viewTitle: UINavigationItem!
 
    
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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        game!.questions.append(Question(imagePath: , name: "Statue de la Liberté"))
        
        startGame()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didChooseAnswer(_ sender: Any) {
        
    }
    
    func toggleHideAnswer() {
        for answer in answers {
            answer.isHidden = !answer.isHidden
        }
    }
    
    private func startGame() {
        loader.isHidden = false
        toggleHideAnswer()
        
        image.image = UIImage(named: game!.currentQuestion.imagePath)
        viewTitle.title = "Question N°"+game!.indexQuestion()
        
        //game.refresh()
    }
    
    @objc func questionLoaded() {
        loader.isHidden = true
//        newGameButton.isHidden = false
//        question.title = game.currentQuestion.title
    }
}
