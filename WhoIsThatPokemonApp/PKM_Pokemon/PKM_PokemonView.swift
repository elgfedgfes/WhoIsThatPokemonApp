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
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showLoader()
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
    func showLoader() {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = view.center
        activityIndicator.color = .red
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
        view.isUserInteractionEnabled = false
    }
    
    func dismissLoader() {
        if let activityIndicator = view.subviews.first(where: { $0 is UIActivityIndicatorView }) as? UIActivityIndicatorView {
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
            view.isUserInteractionEnabled = true
        }
    }
    
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
            self?.ui?.pokemonImage.kf.setImage(with: url, options: [.processor(effect)], completionHandler: { result in
                self?.dismissLoader()
            })
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
//            ui?.pokemonMessage.text = "Nooo, es un \(correctAnswer)"
//            let url = URL(string: correctAnswerImage)
//            ui?.pokemonImage.kf.setImage(with: url)
//            ui?.changeStrokeColorButton(sender, correctAnswer: false)
//            Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { [weak self] timer in
//                self?.presenter?.requestPokemon()
//                self?.resetGame()
//                self?.ui?.restoreStrokeButton(sender)
//            }
            ui?.restoreStrokeButton(sender)
            let controller = PKMN_GameOverMain.createModule(delegate: self, correctAnswer: correctAnswer, correctAnswerImage: correctAnswerImage, finalScore: pokemonGameManager.score)
            controller.modalPresentationStyle = .fullScreen
            present(controller, animated: true, completion: nil)
        }
    }
    
}

extension PKM_PokemonView: PKMN_GameOverViewDelegate {
    func notifyPlayAgainFormResults() {
        presenter?.requestPokemon()
        resetGame()
    }
}
