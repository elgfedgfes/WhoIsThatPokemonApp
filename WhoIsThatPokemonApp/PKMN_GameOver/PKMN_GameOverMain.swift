//
//  PKMN_GameOverMain.swift
//  WhoIsThatPokemonApp
//
//  Created by Luis Fernando Sánchez Palma on 06/03/24.
//

import UIKit

class PKMN_GameOverMain {
    public static func createModule(delegate: PKMN_GameOverViewDelegate, correctAnswer: String, correctAnswerImage: String, finalScore: Int) -> UIViewController {
        let viewController: PKMN_GameOverView? = PKMN_GameOverView()
        if let view = viewController {
            view.pokemonName = correctAnswer
            view.pokemonImageURL = correctAnswerImage
            view.finalScore = finalScore
            view.delegate = delegate
            return view
        }
        return UIViewController()
    }
}
