//
//  PKMN_GameOverViewUI.swift
//  WhoIsThatPokemonApp
//
//  Created by Luis Fernando Sánchez Palma on 06/03/24.
//

import UIKit
import Kingfisher

protocol PKMN_GameOverViewUIDelegate {
    func notifyPlayAgain()
}

class PKMN_GameOverViewUI: UIView {
    var delegate: PKMN_GameOverViewUIDelegate?
    
    var pokemonName: String = ""
    var pokemonImageURL: String = ""
    var finalScore: Int = 0
    
    lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "DefaultBackgroundColor", in: Bundle.main, compatibleWith: nil)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var stackContainer : UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .equalCentering
        stack.spacing = 60
        stack.contentMode = .scaleToFill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "¡OOOPS! Perdiste"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 25)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var stackPokemon : UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 20
        stack.contentMode = .scaleToFill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var pokemonImage: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.image = UIImage(named: "Pikachu", in: Bundle.main, compatibleWith: nil)
        image.kf.setImage(with: URL(string: pokemonImageURL))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var pokemonMessage: UILabel = {
       let label = UILabel()
        label.text = "No, es un \(pokemonName)"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 21)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var scoreLabel: UILabel = {
       let label = UILabel()
        label.text = "Perdiste, tu puntaje fue de \(finalScore)."
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 21)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var playAgainButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Jugar de nuevo", for: .normal)
        btn.backgroundColor = .systemBlue
        btn.addTarget(self, action: #selector(self.playAgainTriggered), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
       return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public convenience init(delegate: PKMN_GameOverViewUIDelegate, correctAnswer: String, correctAnswerImage: String, finalScore: Int) {
        self.init()
        self.delegate = delegate
        self.pokemonName = correctAnswer
        self.pokemonImageURL = correctAnswerImage
        self.finalScore = finalScore
        setupUIElements()
        setupConstraints()
    }
    
    fileprivate func setupUIElements() {
        self.addSubview(cardView)
        cardView.addSubview(stackContainer)
        
        stackContainer.addArrangedSubview(headerLabel)
        stackContainer.addArrangedSubview(stackPokemon)
        stackContainer.addArrangedSubview(scoreLabel)
        stackContainer.addArrangedSubview(playAgainButton)
        
        stackPokemon.addArrangedSubview(pokemonImage)
        stackPokemon.addArrangedSubview(pokemonMessage)
        
    }
    
    fileprivate func setupConstraints() {
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            cardView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            cardView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
            stackContainer.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 20),
            stackContainer.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -20),
            stackContainer.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
            stackContainer.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
            
            pokemonImage.heightAnchor.constraint(equalToConstant: 255),
            pokemonImage.widthAnchor.constraint(equalToConstant: 255)
        ])
    }
    
    @objc func playAgainTriggered(_ sender: UIButton) {
        delegate?.notifyPlayAgain()
    }
}
