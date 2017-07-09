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
