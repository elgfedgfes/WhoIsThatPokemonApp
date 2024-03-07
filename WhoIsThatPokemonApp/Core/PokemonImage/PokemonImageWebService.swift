//
//  PokemonImageWebService.swift
//  WhoIsThatPokemonApp
//
//  Created by Luis Fernando Sánchez Palma on 04/03/24.
//

import Foundation

internal class PokemonImageWebService: NSObject {
    func getImagePokemon(urlImage: String, completion: @escaping (Result<PokemonImageModel, NetworkError>) -> Void) {
        // MARK: - Create/get URL
        if let urlObject = URL(string: urlImage) {
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
                
                if let json = self.parseJSON(pokemonImageData: returnedData) {
                    completion(.success(json))
                }
            }
            // MARK: - Start the task
            task.resume()
        }
    }
    
    private func parseJSON(pokemonImageData: Data) -> PokemonImageModel? {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(PokemonImageResponse.self, from: pokemonImageData)
            let image = decodeData.sprites?.other?.officialArtwork?.frontDefault ?? ""
            return PokemonImageModel(imageURL: image)
        } catch {
            return nil
        }
    }
}
