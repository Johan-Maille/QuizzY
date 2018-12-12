//
//  EnGameOneController.swift
//  QuizzY
//
//  Created by Nils Toularastel on 12/12/2018.
//  Copyright © 2018 Johan Maille--Guilloux. All rights reserved.
//

import UIKit

class EndGameOneController: UIViewController {

    var game: Game? = nil
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let score: String = "\(game!.score) / \(game!.questions.count)"
        scoreLabel.text = setStyleScore(percent: game!.questionPercentage) + "\n" + score
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didReplay(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        game!.start()
        
        switch game!.gameMod {
            case .text:
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "GameOne") as! GameOneController
                
                nextViewController.game = game
                self.present(nextViewController, animated: true, completion: nil)
            
            case .pictures:
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "GameTwo") as! GameTwoController
                
                nextViewController.game = game
                self.present(nextViewController, animated: true, completion: nil)
            
            default:
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MainMenu") as! MainMenuController
                
                self.present(nextViewController, animated: true, completion: nil)
            
        }
    }
    
    func setStyleScore(percent: Float) -> String {
        var res: String
        
        switch percent {
            case 1:
                res = "Good Job !"
                scoreLabel.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
            
            default:
                res = "Bad..."
                scoreLabel.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        }
        
        return res
    }
    
}
