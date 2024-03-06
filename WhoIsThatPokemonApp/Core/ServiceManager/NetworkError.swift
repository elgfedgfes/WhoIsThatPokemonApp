//
//  NetworkError.swift
//  WhoIsThatPokemonApp
//
//  Created by Luis Fernando Sánchez Palma on 06/03/24.
//

import Foundation

public enum NetworkError: Error {
    case notNetwork
    case notFound
    case timeOut
    
    /// Indicates the server responded with an unexpected status code.
    /// - parameter Int: The status code the server respodned with.
    /// - parameter Data?: The raw returned data from the server
    case unexpectedStatusCode(Int, Data?)

    /// Indicates that the server responded using an unknown protocol.
    /// - parameter Data?: The raw returned data from the server
    case badResponse(Data?)

    /// Indicates the server's response could not be deserialized using the given Deserializer.
    /// - parameter Data: The raw returned data from the server
    case malformedResponse(Data?)

    /// Inidcates the server did not respond to the request.
    case noResponse
    
    /// Badn URL
    case badURL
}
