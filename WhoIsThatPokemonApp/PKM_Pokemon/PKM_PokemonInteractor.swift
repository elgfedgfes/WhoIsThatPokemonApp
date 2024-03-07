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
        pokemonListWebService.getListPokemon { [weak self] result in
            switch result {
            case .success(let responseData):
                self?.presenter?.responsePokemonList(pokemonList: responseData)
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func fetchPokemonImage(urlImage: String) {
        pokemonImageWebService.getImagePokemon(urlImage: urlImage) { [weak self] result in
            switch result {
            case .success(let responseData):
                self?.presenter?.responsePokemonImage(image: responseData.imageURL)
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
