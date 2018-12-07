//
//  ChooseDifficulty.swift
//  QuizzY
//
//  Created by Nils Toularastel on 03/12/2018.
//  Copyright © 2018 Johan Maille--Guilloux. All rights reserved.
//

import UIKit

class DifficultyController: UIViewController {

    var gameMod: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didChooseDifficult(_ sender: Any) {
        let chooseDifficulty = sender as? UIButton
        let difficult: String = (chooseDifficulty?.accessibilityIdentifier)!
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let game = Game()
        
        game.setGameMod(jeu: gameMod)
        game.setDifficult(difficulty: difficult)
        
        switch gameMod {
            case "game1":
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "GameOne") as! GameOneController
                
                nextViewController.game = game
                self.present(nextViewController, animated: true, completion: nil)
            
            case "game2":
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "GameTwo") as! GameTwoController
                
                nextViewController.game = game
                self.present(nextViewController, animated: true, completion: nil)
            
            default:
                print("Error : unknown game mod")
        }
    }
    
}
