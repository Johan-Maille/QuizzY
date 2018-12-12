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
    
    @IBOutlet weak var labelScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelScore.text = "\(game!.score) / \(game!.questions.count)"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didClickReplay(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "GameOne") as! GameOneController
        
        game?.restart()
        nextViewController.game = game
        self.present(nextViewController, animated: true, completion: nil)
    }
    

}
