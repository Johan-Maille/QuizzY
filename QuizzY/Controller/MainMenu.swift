//
//  ViewController.swift
//  QuizzY
//
//  Created by Johan Maille--Guilloux on 03/12/2018.
//  Copyright © 2018 Johan Maille--Guilloux. All rights reserved.
//

import UIKit

class MainMenu: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let chooseDifficulty = segue.destination as? ChooseDifficulty {
            let game = Game()
            
//            switch segue.identifier {
//                case "jeu1":
//                    game.gameMod = .text
//
//            case .none:
//                <#code#>
//            case .some(_):
//                <#code#>
//            }
            
            
            chooseDifficulty.game = game
        }
    }
    
}

