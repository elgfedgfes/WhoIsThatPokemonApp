//
//  PKM_PokemonView.swift
//  WhoIsThatPokemonApp
//
//  Created by Luis Fernando Sánchez Palma on 04/03/24.
//

import UIKit

class PKM_PokemonView: UIViewController {
    
    var presenter: PKM_PokemonPresenterProtocol?
    var ui: PKM_PokemonViewUI?
    
    override func loadView() {
        ui = PKM_PokemonViewUI(delegate: self)
        view = ui
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}


extension PKM_PokemonView: PKM_PokemonViewProtocol {
    
}

extension PKM_PokemonView: PKM_PokemonViewUIDelegate {
    
}
