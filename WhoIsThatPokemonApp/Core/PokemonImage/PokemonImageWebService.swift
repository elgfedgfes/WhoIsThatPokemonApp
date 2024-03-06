//
//  PokemonImageWebService.swift
//  WhoIsThatPokemonApp
//
//  Created by Luis Fernando Sánchez Palma on 04/03/24.
//

import Foundation

internal class PokemonImageWebService: NSObject {
    func getImagePokemon(urlImage: String, completionHandler: @escaping (PokemonImageModel?, Int, String)->Void) {
        // MARK: - Create/get URL
        if let urlObject = URL(string: urlImage) {
            var urlRequest = URLRequest(url: urlObject)
            urlRequest.httpMethod = "GET"
            // MARK: - Create the URLSession
            let session = URLSession(configuration: .default)
            // MARK: - Give the session a task
            let task = session.dataTask(with: urlRequest) {data, response, error in
                if let responseData = data {
                    if let json = self.parseJSON(pokemonImageData: responseData) {
                        completionHandler(json, 200, "")
                    }
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
