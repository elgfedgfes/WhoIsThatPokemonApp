//
//  PKM_PokemonViewUI.swift
//  WhoIsThatPokemonApp
//
//  Created by Luis Fernando Sánchez Palma on 04/03/24.
//

import UIKit

protocol PKM_PokemonViewUIDelegate {
    
}

class PKM_PokemonViewUI: UIView {
    var delegate: PKM_PokemonViewUIDelegate?
    
    lazy var pokemonAnswerButtons: [UIButton] = [firstButton, secondButton, thirdButton, fourthButton]
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView (frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.clipsToBounds = false
        return scrollView
    }()
    
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
    
    lazy var stackHeader : UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 20
        stack.contentMode = .scaleToFill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var headerTitle: UILabel = {
       let label = UILabel()
        label.text = "¿Quién es este Pokémon?"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 25)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var headerScore: UILabel = {
       let label = UILabel()
        label.text = "Puntaje: 0"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 21)
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
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var pokemonMessage: UILabel = {
       let label = UILabel()
        label.text = "Sí, es un Pikachu"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 21)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var stackButtons : UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 20
        stack.contentMode = .scaleToFill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var firstButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Flaaffy", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .white
        btn.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
        btn.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        btn.layer.shadowOpacity = 1.0
        btn.layer.shadowRadius = 0
        btn.layer.masksToBounds = false
        btn.layer.cornerRadius = 10.0
        btn.translatesAutoresizingMaskIntoConstraints = false
       return btn
    }()
    
    lazy var secondButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Staravia", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .white
        btn.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
        btn.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        btn.layer.shadowOpacity = 1.0
        btn.layer.shadowRadius = 0
        btn.layer.masksToBounds = false
        btn.layer.cornerRadius = 10.0
        btn.translatesAutoresizingMaskIntoConstraints = false
       return btn
    }()
    
    lazy var thirdButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Carvanha", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .white
        btn.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
        btn.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        btn.layer.shadowOpacity = 1.0
        btn.layer.shadowRadius = 0
        btn.layer.masksToBounds = false
        btn.layer.cornerRadius = 10.0
        btn.translatesAutoresizingMaskIntoConstraints = false
       return btn
    }()
    
    lazy var fourthButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Pikachu", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .white
        btn.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
        btn.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        btn.layer.shadowOpacity = 1.0
        btn.layer.shadowRadius = 0
        btn.layer.masksToBounds = false
        btn.layer.cornerRadius = 10.0
        btn.translatesAutoresizingMaskIntoConstraints = false
       return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public convenience init(delegate: PKM_PokemonViewUIDelegate) {
        self.init()
        self.delegate = delegate
        setupUIElements()
        setupConstraints()
    }
    
    fileprivate func setupUIElements() {
        self.addSubview(scrollView)
        scrollView.addSubview(cardView)
        cardView.addSubview(stackContainer)
        
        stackContainer.addArrangedSubview(stackHeader)
        stackContainer.addArrangedSubview(stackPokemon)
        stackContainer.addArrangedSubview(stackButtons)
        
        stackHeader.addArrangedSubview(headerTitle)
        stackHeader.addArrangedSubview(headerScore)
        
        stackPokemon.addArrangedSubview(pokemonImage)
        stackPokemon.addArrangedSubview(pokemonMessage)
        
        stackButtons.addArrangedSubview(firstButton)
        stackButtons.addArrangedSubview(secondButton)
        stackButtons.addArrangedSubview(thirdButton)
        stackButtons.addArrangedSubview(fourthButton)
        
    }
    
    fileprivate func setupConstraints() {
        NSLayoutConstraint.activate([
                        
            scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
            cardView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            cardView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            cardView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            cardView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            stackContainer.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 20),
            stackContainer.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -20),
            stackContainer.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
            stackContainer.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
            
            pokemonImage.heightAnchor.constraint(equalToConstant: 255),
            pokemonImage.widthAnchor.constraint(equalToConstant: 255),
            
            stackButtons.leadingAnchor.constraint(equalTo: stackContainer.leadingAnchor, constant: 20),
            stackButtons.trailingAnchor.constraint(equalTo: stackContainer.trailingAnchor, constant: -20)
            
        ])
    }
}
