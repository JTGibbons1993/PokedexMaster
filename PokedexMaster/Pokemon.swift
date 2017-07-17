//
//  Pokemon.swift
//  PokedexMaster
//
//  Created by user on 7/6/17.
//  Copyright © 2017 John. All rights reserved.
//

import Foundation
import Alamofire

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
    private var _evoNextEvolutionName: String!
    private var _evoNextEvolutionID: String!
    private var _evoNextEvolutionLevel: String!
    private var _pokemonURL: String!
    
    //getters
    var nextEvolutionLevel: String {
        if _evoNextEvolutionLevel == nil {
            _evoNextEvolutionLevel = ""
        }
        return _evoNextEvolutionLevel
    }
    var nextEvolutionID: String {
        if _evoNextEvolutionID == nil {
            _evoNextEvolutionID = ""
        }
        return _evoNextEvolutionID
    }
    var nextEvolutionName: String {
        if _evoNextEvolutionName == nil {
            _evoNextEvolutionName = ""
        }
        return _evoNextEvolutionName
    }
    
    var description: String {
        if _description == nil {
            _description = ""
        }
        return _description
    }
    var type: String {
        if _type == nil {
            _type = ""
        }
        return _type
    }
    var defense: String {
        if _defense == nil {
            _defense = ""
        }
        return _defense
    }
    var height: String {
        if _height == nil {
            _height = ""
        }
    return _height
    }
    var weight: String {
        if _weight == nil {
            _weight = ""
        }
        return _weight
    }
    var attack: String {
        if _attack == nil {
            _attack = ""
        }
        return _attack
    }
    var nextEvolutionText: String {
        if _evoNextEvolutionTxt == nil {
            _evoNextEvolutionTxt = "No Evolution"
        }
        return _evoNextEvolutionTxt
    }
    var name: String {
        
        return _name
    }
    
    var pokedexId: Int {
        
        return _pokedexId
    }
    
    init(name: String, pokedexId: Int) {
        
        self._name = name
        self._pokedexId = pokedexId
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexId)/"
    }
    
    func pokemonDownloadDetails(completed: @escaping DownloadComplete) {
        Alamofire.request(_pokemonURL).responseJSON { response in
            if let dict = response.result.value as? [String:AnyObject] {
                if let weight = dict["weight"] as? String {
                    self._weight = weight
                }
                if let height = dict["height"] as? String {
                    self._height = height
                }
                if let attack = dict["attack"] as? Int {
                    self._attack = "\(attack)"
                }
                if let defense = dict["defense"] as? Int {
                    self._defense = "\(defense)"
                }
         
                if let types = dict["types"] as? [[String:String]] , types.count > 0 {
                    if let type = types[0]["name"] {
                        self._type = type.capitalized
                        
                    }
                    if types.count > 1 {
                        for x in 1..<types.count{
                            if let name = types[x]["name"] {
                                self._type! += "/\(name.capitalized)"
                            }
                        }
                    }
                }
                if let descArray = dict["descriptions"] as? [[String:String]], descArray.count > 0 {
                    if let url = descArray[0]["resource_uri"] {
                        let descURL = "\(URL_BASE)\(url)"
                        Alamofire.request(descURL).responseJSON {response in
                            if let descResult = response.result.value as? [String: AnyObject] {
                                if let description = descResult["description"] as? String {
                                    let newDescription = description.replacingOccurrences(of: "POKMON", with: "Pokemon")
                                    self._description = newDescription.capitalized
                                }
                            }
                            completed()
                        }
                    }
                }
                if let evolutions = dict["evolutions"] as? [[String:AnyObject]], evolutions.count > 0 {
                    if let nextEvolutions = evolutions[0]["to"] as? String {
                        if nextEvolutions.range(of: "mega") == nil {
                            self._evoNextEvolutionName = nextEvolutions
                            
                            if let uri = evolutions[0]["resource_uri"] as? String {
                                let newString = uri.replacingOccurrences(of: "/api/v1/pokemon/", with: "")
                                let nextEvoID = newString.replacingOccurrences(of: "/", with: "")
                                self._evoNextEvolutionID = nextEvoID
                                
                                if let evolutionsExist = evolutions[0]["level"], evolutions.count > 0 {
                                    if let lvl = evolutionsExist as? Int {
                                        self._evoNextEvolutionLevel = String(lvl)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            completed()
        }
        
    }
    
    
}
