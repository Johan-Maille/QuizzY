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
        activityIndicator.isHidden = true
        newGameButton.isHidden = false
        questionView.title = game.currentQuestion.title
    }
}
