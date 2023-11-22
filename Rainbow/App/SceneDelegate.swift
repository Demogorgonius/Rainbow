//
//  SceneDelegate.swift
//  Rainbow
//
//  Created by Sergey on 12.11.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        let window = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController()
        let mainViewController = MainBuilder(navigationVC: navigationController).build()
        navigationController.setViewControllers([mainViewController], animated: true)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        self.window = window
    }
}

