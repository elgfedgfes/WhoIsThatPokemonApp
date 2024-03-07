//
//  PokemonWebService.swift
//  WhoIsThatPokemonApp
//
//  Created by Luis Fernando Sánchez Palma on 04/03/24.
//

import Foundation

internal class PokemonWebService: NSObject {
    func getListPokemon(completion: @escaping (Result<[PokemonModel], NetworkError>) -> Void) {
        let pokemonURL: String = "https://pokeapi.co/api/v2/pokemon?limit=1302"
        // MARK: - Create/get URL
        if let urlObject = URL(string: pokemonURL) {
            var urlRequest = URLRequest(url: urlObject)
            urlRequest.httpMethod = "GET"
            // MARK: - Create the URLSession
            let session = URLSession(configuration: .default)
            // MARK: - Give the session a task
            let task = session.dataTask(with: urlRequest) {data, response, error in
                
                if let _ = error {
                    completion(.failure(NetworkError.badResponse(data)))
                    return
                }
                
                guard let returnedData = data else {
                    completion(.failure(NetworkError.noResponse))
                    return
                }
                
                if let json = self.parseJSON(pokemonData: returnedData) {
                    completion(.success(json))
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
