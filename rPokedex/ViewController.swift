//
//  ViewController.swift
//  rPokedex
//
//  Created by Rasmus Josefsson on 2016-12-25.
//  Copyright © 2016 Rasmus Josefsson. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    

    @IBOutlet weak var collection: UICollectionView!
    
    var pokemons = [Pokemon]()
    var musicPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.dataSource = self
        collection.delegate = self
        
        parsePokemonCSV()
        initAudio()
        
    }

    func initAudio() {
        let path = Bundle.main.path(forResource: "pokeMusic", ofType: "mp3")!
        
        do {
            musicPlayer = try AVAudioPlayer(contentsOf: URL(string: path)!)
            musicPlayer.prepareToPlay()
            musicPlayer.numberOfLoops = -1 // infinite loop of the song
            musicPlayer.play()
    
        } catch let error as NSError {
                
                print("Error: \(error.debugDescription)")
            }
    }
  
    
    
    func parsePokemonCSV() {
        let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")
        
        do {
            let csv = try CSV(contentsOfURL: path!)
            let rows = csv.rows
            print(rows)
            
            for row in rows {
                // ok to unwrap beacuse of the csv file is local
                let pokeId = Int(row["id"]!)!
                let pokeName = row["identifier"]!
                
                let pokemon = Pokemon(name: pokeName, id: pokeId)
                pokemons.append(pokemon)
            }
            
            
        }
        catch let error as NSError {
            
            print("Error: \(error.debugDescription)")
        }
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell {
            

            let pokemon = pokemons[indexPath.row]
            
            cell.configureCell(pokemon)
            
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Detail stuffs
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons.count
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 105)
    }
    
    

    @IBAction func pokeMusicBtnPressed(_ sender: UIButton) {
        
        if musicPlayer.isPlaying {
            musicPlayer.pause()
            sender.alpha = 0.2
        } else {
            musicPlayer.play()
            sender.alpha = 1.0
        }
        
    }
    
    

}

