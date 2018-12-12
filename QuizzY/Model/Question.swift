//
//  Test.swift
//  QuizzY
//
//  Created by Nils Toularastel on 03/12/2018.
//  Copyright © 2018 Johan Maille--Guilloux. All rights reserved.
//

import Foundation

// Structure représentant les questions posées
struct Question: Decodable {
    var imagePath: String = "Loading" // Le chemin de l'image de la question à afficher (image du monument ici)
    var name: String = "Loading" // Le nom de la question qui sera affiché (nom du monument)
}
