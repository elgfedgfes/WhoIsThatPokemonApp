//
//  PokemonImageResponse.swift
//  WhoIsThatPokemonApp
//
//  Created by Luis Fernando Sánchez Palma on 04/03/24.
//

import Foundation
// MARK: - Modelo de respuesta del servicio
// MARK: - PokemonImageResponse
struct PokemonImageResponse: Codable {
    let sprites: Sprites?
    
    enum CodingKeys: String, CodingKey {
        case sprites = "sprites"
    }
}

class Sprites: Codable {
    let other: Other?
    
    enum CodingKeys: String, CodingKey {
        case other = "other"
    }

    init(other: Other?) {
        self.other = other
    }
}

struct Other: Codable {
    let officialArtwork: OfficialArtwork?

    enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }
}

struct OfficialArtwork: Codable {
    let frontDefault: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

// MARK: - Modelo para la recuperación del url de la imagen
struct PokemonImageModel {
    let imageURL: String
}
