//
//  PokemonGameRules.swift
//  WhoIsThatPokemonApp
//
//  Created by Luis Fernando Sánchez Palma on 06/03/24.
//

import Foundation

struct PokemonGameRules {
    var score = 0
    // MARK: - Check correct answer
    mutating func checkAnswer(_ userAnswer: String, _ correctAnswer: String) -> Bool {
        if userAnswer.lowercased() == correctAnswer.lowercased() {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    func getScore() -> Int {
        return score
    }
    
    mutating func setScore(score: Int) {
        self.score = score
    }
}
