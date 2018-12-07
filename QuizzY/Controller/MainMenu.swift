//
//  ViewController.swift
//  QuizzY
//
//  Created by Johan Maille--Guilloux on 03/12/2018.
//  Copyright © 2018 Johan Maille--Guilloux. All rights reserved.
//

import UIKit

class MainMenuController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let chooseDifficulty = segue.destination as? DifficultyController {
            // let game = Game()
            // let jeu: String =
            
            // game.chooseGameMod(jeu: jeu)
            
            chooseDifficulty.gameMod = segue.identifier!
        }
    }
    
}

