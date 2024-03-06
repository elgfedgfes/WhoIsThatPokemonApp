//
//  PKM_PokemonProtocols.swift
//  WhoIsThatPokemonApp
//
//  Created by Luis Fernando Sánchez Palma on 04/03/24.
//

import Foundation

protocol PKM_PokemonViewProtocol: AnyObject {
    func displayPokemon(pokemonList: [PokemonModel])
    func displayPokemonImage(image: String)
}

protocol PKM_PokemonInteractorProtocol: AnyObject {
    func fetchPokemon()
    func fetchPokemonImage(urlImage: String)
}

protocol PKM_PokemonPresenterProtocol: AnyObject {
    func requestPokemon()
    func responsePokemonList(pokemonList: [PokemonModel])
    func requestPokemonImage(urlImage: String)
    func responsePokemonImage(image: String)
}

protocol PKM_PokemonRouterProtocol: AnyObject {
    
}
