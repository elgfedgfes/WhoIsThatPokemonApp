//
//  PokemonMain.swift
//  WhoIsThatPokemonApp
//
//  Created by Luis Fernando Sánchez Palma on 04/03/24.
//

import UIKit

class PokemonMain {
    public static func createModule(navigation : UINavigationController?) -> UIViewController {
        let viewController: PokemonView? = PokemonView()
        if let view = viewController {
            let presenter = PokemonPresenter()
            let router = PokemonRouter()
            let interactor = PokemonInteractor()
            
            view.presenter = presenter
            
            presenter.view = view
            presenter.interactor = interactor
            presenter.router = router
            
            interactor.presenter = presenter
            
            router.navigation = navigation
            return view
        }
        return UIViewController()
    }
}
