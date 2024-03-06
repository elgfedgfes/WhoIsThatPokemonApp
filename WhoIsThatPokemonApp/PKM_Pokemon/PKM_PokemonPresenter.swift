//
//  PPKM_PokemonPresenter.swift
//  WhoIsThatPokemonApp
//
//  Created by Luis Fernando Sánchez Palma on 04/03/24.
//

import UIKit

class PKM_PokemonPresenter {
    weak var view: PKM_PokemonViewProtocol?
    var interactor: PKM_PokemonInteractorProtocol?
    var router: PKM_PokemonRouterProtocol?
}

extension PKM_PokemonPresenter : PKM_PokemonPresenterProtocol {
    func requestPokemon() {
        //Mostrar loader desde view
        interactor?.fetchPokemon()
    }
    
    func responsePokemonList(pokemonList: [PokemonModel]) {
        view?.displayPokemon(pokemonList: pokemonList)
    }
    
    func requestPokemonImage(urlImage: String) {
        interactor?.fetchPokemonImage(urlImage: urlImage)
    }
    
    func responsePokemonImage(image: String) {
        view?.displayPokemonImage(image: image)
    }

}
