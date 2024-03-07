//
//  PKMN_GameOverView.swift
//  WhoIsThatPokemonApp
//
//  Created by Luis Fernando Sánchez Palma on 06/03/24.
//

import UIKit

public protocol PKMN_GameOverViewDelegate {
    func notifyPlayAgainFormResults()
}

class PKMN_GameOverView: UIViewController {
    var ui: PKMN_GameOverViewUI?
    
    var pokemonName: String = ""
    var pokemonImageURL: String = ""
    var finalScore: Int = 0
    
    var delegate : PKMN_GameOverViewDelegate?
    
    override func loadView() {
        ui = PKMN_GameOverViewUI(delegate: self, correctAnswer: pokemonName, correctAnswerImage: pokemonImageURL, finalScore: finalScore)
        view = ui
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "DefaultBackgroundColor", in: Bundle.main, compatibleWith: nil)
    }
}

extension PKMN_GameOverView: PKMN_GameOverViewUIDelegate {
    func notifyPlayAgain() {
        delegate?.notifyPlayAgainFormResults()
        dismiss(animated: true)
    }
}
