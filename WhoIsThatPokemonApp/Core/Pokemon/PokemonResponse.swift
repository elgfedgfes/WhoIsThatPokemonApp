//
//  PokemonResponse.swift
//  WhoIsThatPokemonApp
//
//  Created by Luis Fernando Sánchez Palma on 04/03/24.
//

import Foundation
// MARK: - Modelo de respuesta del servicio
struct PokemonResponse: Codable {
    let count       :   Int?
    let next        :   String?
    let previous    :   String?
    let results     :   [_Results]?
    
    enum CodingKeys: String, CodingKey {
        case count      = "count"
        case next       = "next"
        case previous   = "previous"
        case results    = "results"
    }
}

struct _Results: Codable {
    let name    :   String?
    let url     :   String?
    
    enum CodingKeys: String, CodingKey {
        case name      = "name"
        case url       = "url"
    }
}

// MARK: - Modelo para el guardado del pokemon en un arreglo
struct PokemonModel {
    let name: String
    let imageURL: String
}
