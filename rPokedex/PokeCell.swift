//
//  PokeCell.swift
//  rPokedex
//
//  Created by Rasmus Josefsson on 2016-12-25.
//  Copyright © 2016 Rasmus Josefsson. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImage: UIImageView!
    @IBOutlet weak var pokeNameLabel: UILabel!
    
    var pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0
    }
    
    
    func configureCell(_ pokemon: Pokemon) {
        self.pokemon = pokemon
        
        pokeNameLabel.text = pokemon.name.capitalized
        thumbImage.image = UIImage(named: "\(pokemon.id)")
        
    }
}
