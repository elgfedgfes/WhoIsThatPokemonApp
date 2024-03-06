//
//  PKM_PokemonView.swift
//  WhoIsThatPokemonApp
//
//  Created by Luis Fernando Sánchez Palma on 04/03/24.
//

import UIKit
import Kingfisher

class PKM_PokemonView: UIViewController {
    
    var presenter: PKM_PokemonPresenterProtocol?
    var ui: PKM_PokemonViewUI?
    private var pokemonGameManager = PokemonGameRules()
    private var random4Pokemons: [PokemonModel] = [] {
        didSet {
            setButtonTitles()
        }
    }
    private var correctAnswer: String = ""
    private var correctAnswerImage: String = ""
    
    override func loadView() {
        ui = PKM_PokemonViewUI(delegate: self)
        view = ui
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.requestPokemon()
    }
    
    
    func setButtonTitles() {
        guard let buttonsToChangeTitle = ui?.pokemonAnswerButtons else {
            //mensaje de error al viwe
            return
        }
        for (index, button) in buttonsToChangeTitle.enumerated() {
            DispatchQueue.main.async { [self] in
                button.setTitle(random4Pokemons[index].name.capitalized, for: .normal)
            }
        }
    }
    
    func resetGame() {
        pokemonGameManager.setScore(score: 0)
        ui?.headerScore.text = "Puntaje: \(pokemonGameManager.score)"
        ui?.pokemonMessage.text = " "
    }
}


extension PKM_PokemonView: PKM_PokemonViewProtocol {
    func displayPokemon(pokemonList: [PokemonModel]) {
        random4Pokemons = pokemonList.choose(4)
        let index = Int.random(in: 0...3)
        let imageData = random4Pokemons[index].imageURL
        correctAnswer = random4Pokemons[index].name
        presenter?.requestPokemonImage(urlImage: imageData)
    }
    
    func displayPokemonImage(image: String) {
        correctAnswerImage = image
        DispatchQueue.main.async { [weak self] in
            let url = URL(string: image)
            let effect = ColorControlsProcessor(brightness: -1, contrast: 1, saturation: 1, inputEV: 0)
            self?.ui?.pokemonImage.kf.setImage(with: url, options: [.processor(effect)])
        }
    }
    
}

extension PKM_PokemonView: PKM_PokemonViewUIDelegate {
    func notifyUserAnswer(_ sender: UIButton) {
        let userAnswer = sender.title(for: .normal) ?? ""
        if pokemonGameManager.checkAnswer(userAnswer, correctAnswer) {
            ui?.pokemonMessage.text = "Sí, es un \(userAnswer)"
            ui?.headerScore.text = "Puntaje: \(pokemonGameManager.score)"
            let url = URL(string: correctAnswerImage)
            ui?.pokemonImage.kf.setImage(with: url)
            ui?.changeStrokeColorButton(sender, correctAnswer: true)
            Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { [weak self] timer in
                self?.presenter?.requestPokemon()
                self?.ui?.pokemonMessage.text = " "
                self?.ui?.restoreStrokeButton(sender)
            }
        } else {
            ui?.pokemonMessage.text = "Nooo, es un \(correctAnswer)"
            let url = URL(string: correctAnswerImage)
            ui?.pokemonImage.kf.setImage(with: url)
            ui?.changeStrokeColorButton(sender, correctAnswer: false)
            Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { [weak self] timer in
                self?.presenter?.requestPokemon()
                self?.resetGame()
                self?.ui?.restoreStrokeButton(sender)
            }
        }
    }
    
}
