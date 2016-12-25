//
//  Pokemon.swift
//  rPokedex
//
//  Created by Rasmus Josefsson on 2016-12-25.
//  Copyright © 2016 Rasmus Josefsson. All rights reserved.
//

import Foundation

class Pokemon {


    fileprivate var _id: Int!
    fileprivate var _name: String!

    
    var name: String {
        return _name
    }
    
    var id: Int {
        return _id
    }
    

    init(name: String, id: Int) {
        _name = name
        _id = id
    }
    
    
}
