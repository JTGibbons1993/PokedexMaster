//
//  PokemonDetailVC.swift
//  PokedexMaster
//
//  Created by user on 7/8/17.
//  Copyright © 2017 John. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    var pokemon: Pokemon!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = pokemon.name

    }



}
