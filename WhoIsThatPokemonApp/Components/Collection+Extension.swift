//
//  Collection+Extension.swift
//  WhoIsThatPokemonApp
//
//  Created by Luis Fernando Sánchez Palma on 05/03/24.
//

import UIKit

extension Collection where Indices.Iterator.Element == Index {
    public subscript(safe index: Index) -> Iterator.Element? {
        return(startIndex <= index && index < endIndex) ? self[index] : nil
    }
}

extension Collection {
    func choose(_ n: Int) -> Array<Element> {
        Array(shuffled().prefix(n))
    }
}
