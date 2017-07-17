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
    @IBOutlet weak var mainImg: UIImageView! //before making connection the circle was already filled
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var DefenseLabel: UILabel!
    @IBOutlet weak var hLabel: UILabel!
    @IBOutlet weak var wLabel: UILabel!
    @IBOutlet weak var IDLabel: UILabel!
    @IBOutlet weak var BaseAtkLabel: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView! //before making connection the circle was already filled
    @IBOutlet weak var evoLabel: UILabel!
    
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = pokemon.name.capitalized
        
        let img = UIImage(named: String(pokemon.pokedexId))
        mainImg.image = img
        currentEvoImg.image = img
        IDLabel.text = String(pokemon.pokedexId)
        
     //   nextEvoImg.image = UIImage(named: String(pokemon.pokedexId + 1))
     //   evoLabel.text = "Next Evolution: \()"
        
        pokemon.pokemonDownloadDetails {
            //will only be called after the network call is complete
            
            self.updateUI()
        }

    }
    
    func updateUI() {
        BaseAtkLabel.text = pokemon.attack
        DefenseLabel.text = pokemon.defense
        hLabel.text = pokemon.height
        wLabel.text = pokemon.weight
        typeLabel.text = pokemon.type
        descLabel.text = pokemon.description
        
        if pokemon.nextEvolutionID == "" {
            evoLabel.text = "No Evolutions"
            nextEvoImg.isHidden = true
        } else {
            if pokemon.nextEvolutionLevel == ""{
                evoLabel.text = "Next Evolution: \(pokemon.nextEvolutionName.capitalized)"
            } else {
                evoLabel.text = "Next Evolution: \(pokemon.nextEvolutionName.capitalized) - LVL \(pokemon.nextEvolutionLevel)"
            }
            nextEvoImg.isHidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvolutionID)
        }
        
        
    }

    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }


}
