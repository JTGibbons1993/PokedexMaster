//
//  Pokemon.swift
//  PokedexMaster
//
//  Created by user on 7/6/17.
//  Copyright © 2017 John. All rights reserved.
//

import Foundation

class Pokemon {
    
    //properties
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _evoNextEvolutionTxt: String!
    
    //getters
    var name: String {
        
        return _name
    }
    
    var pokedexId: Int {
        
        return _pokedexId
    }
    
    init(name: String, pokedexId: Int) {
        
        self._name = name
        self._pokedexId = pokedexId
    }
}
