//
//  PokemonView.swift
//  WhoIsThatPokemonApp
//
//  Created by Luis Fernando Sánchez Palma on 04/03/24.
//

import UIKit

class PokemonView: UIViewController {
    
    var presenter: PokemonPresenterProtocol?
    var ui: PokemonViewUI?
    
    override func loadView() {
        ui = PokemonViewUI(delegate: self)
        view = ui
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}


extension PokemonView: PokemonViewProtocol {
    
}

extension PokemonView: PokemonViewUIDelegate {
    
}
