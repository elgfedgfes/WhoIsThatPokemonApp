//
//  PokemonWebService.swift
//  WhoIsThatPokemonApp
//
//  Created by Luis Fernando Sánchez Palma on 04/03/24.
//

import Foundation

internal class PokemonWebService: NSObject {
    func getListPokemon(completionHandler: @escaping ([PokemonModel]?, Int, String)->Void) {
        let pokemonURL: String = "https://pokeapi.co/api/v2/pokemon?limit=1302"
        // MARK: - Create/get URL
        if let urlObject = URL(string: pokemonURL) {
            var urlRequest = URLRequest(url: urlObject)
            urlRequest.httpMethod = "GET"
            // MARK: - Create the URLSession
            let session = URLSession(configuration: .default)
            // MARK: - Give the session a task
            let task = session.dataTask(with: urlRequest) {data, response, error in
                if let responseData = data {
                    if let json = self.parseJSON(pokemonData: responseData) {
                        completionHandler(json, 200, "")
                    }
                }
            }
            // MARK: - Start the task
            task.resume()
        }
    }
    
    private func parseJSON(pokemonData: Data) -> [PokemonModel]? {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(PokemonResponse.self, from: pokemonData)
            let pokemon = decodeData.results?.map {
                PokemonModel(name: $0.name ?? "", imageURL: $0.url ?? "")
            }
            return pokemon
        } catch {
            return nil
        }
    }
}
