//
//  PokemonDetailVC.swift
//  pokemonex
//
//  Created by p.mitev on 04.10.16.
//  Copyright © 2016 Petar Mitev. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    var pokemon: Pokemon!

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoimg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    @IBOutlet weak var pokemonexLbl: UILabel!
 
    override func viewDidLoad() {
        super.viewDidLoad()

        
        nameLbl.text = pokemon.name.capitalized
        let img = UIImage(named: "\(pokemon.pocemonexId)")
        mainImg.image = img
        currentEvoImg.image = img
        
          pokemonexLbl.text = "\(pokemon.pocemonexId)"
        pokemon.downloadPokemonDetail {
      
            self.updateUI()
            
            
        }
        
    }
    
    func updateUI(){
        
          
        defenseLbl.text = pokemon.defense
        attackLbl.text = pokemon.attack
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        typeLbl.text = pokemon.type
        descriptLbl.text = pokemon.description
        
        if pokemon.nextEvolutionId == "" {
            
            evoLbl.text = "No Evolutions"
            nextEvoimg.isHidden = true
            
        } else {
            
            nextEvoimg.isHidden = false
            nextEvoimg.image = UIImage(named:pokemon.nextEvolutionId)
            let str = "Next Evolution:\(pokemon.nextEvolutionName) LVL \(pokemon.nextEvolutionId)"
            evoLbl.text = str
        }

       
          }


    @IBAction func backBtn(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
}
