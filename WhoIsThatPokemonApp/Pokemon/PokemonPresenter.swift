//
//  PokemonPresenter.swift
//  WhoIsThatPokemonApp
//
//  Created by Luis Fernando Sánchez Palma on 04/03/24.
//

import UIKit

class PokemonPresenter {
    weak var view: PokemonViewProtocol?
    var interactor: PokemonInteractorProtocol?
    var router: PokemonRouterProtocol?
}

extension PokemonPresenter : PokemonPresenterProtocol {
    
}
