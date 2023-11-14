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
        window.makeKeyAndVisible()
        #warning("MainViewController")
        window.rootViewController = SettingsViewController()
        self.window = window
    }
}

