//
//  PKM_PokemonInteractor.swift
//  WhoIsThatPokemonApp
//
//  Created by Luis Fernando Sánchez Palma on 04/03/24.
//

import UIKit

class PKM_PokemonInteractor {
    weak var presenter: PKM_PokemonPresenterProtocol?
    private let pokemonListWebService =   PokemonWebService()
    private let pokemonImageWebService =   PokemonImageWebService()
}

extension PKM_PokemonInteractor: PKM_PokemonInteractorProtocol {
    func fetchPokemon() {
        pokemonListWebService.getListPokemon { [weak self] responseList, responseCode, responseError in
            guard let pokemonList = responseList else {
                //Mensaje de error al view
                return
            }
            self?.presenter?.responsePokemonList(pokemonList: pokemonList)
        }
    }
    
    func fetchPokemonImage(urlImage: String) {
        pokemonImageWebService.getImagePokemon(urlImage: urlImage) { [weak self] responseImage, responseCode, responseError in
            guard let pokemonImage = responseImage else {
                //Mensaje de error al view
                return
            }
            self?.presenter?.responsePokemonImage(image: pokemonImage.imageURL)
        }
    }
}
