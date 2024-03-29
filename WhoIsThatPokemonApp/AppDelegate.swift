//
//  AppDelegate.swift
//  WhoIsThatPokemonApp
//
//  Created by Luis Fernando Sánchez Palma on 04/03/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    public var window: UIWindow?
    private var navigation: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        navigation = UINavigationController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigation
        window?.backgroundColor = UIColor(named: "DefaultBackgroundColor", in: Bundle.main, compatibleWith: nil)
        window?.makeKeyAndVisible()
        navigation?.isNavigationBarHidden = true
        
        let view = PKM_PokemonMain.createModule(navigation: self.navigation)
        navigation?.pushViewController(view, animated: true)
        return true
    }
    
}

