//
//  PKM_PokemonMain.swift
//  WhoIsThatPokemonApp
//
//  Created by Luis Fernando Sánchez Palma on 04/03/24.
//

import UIKit

class PKM_PokemonMain {
    public static func createModule(navigation : UINavigationController?) -> UIViewController {
        let viewController: PKM_PokemonView? = PKM_PokemonView()
        if let view = viewController {
            let presenter = PKM_PokemonPresenter()
            let router = PKM_PokemonRouter()
            let interactor = PKM_PokemonInteractor()
            
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
