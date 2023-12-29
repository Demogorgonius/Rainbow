

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        let navigationController = UINavigationController()
        let mainViewController = MainBuilder(navigationController: navigationController).build()
    
        navigationController.setViewControllers([mainViewController], animated: true)
        
        window?.rootViewController = navigationController
        
        UserDefaults.standard.addObserver(self, forKeyPath: "theme", options: [.new], context: nil)
        
        window?.makeKeyAndVisible()
        
    }
    
    deinit {
        
        UserDefaults.standard.removeObserver(self, forKeyPath: "theme", context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
        guard  let change = change,
            object != nil,
            let themeValue = change[.newKey] as? String,
            let theme = Theme(rawValue: themeValue)?.uiInterfaceStyle
        else { return }

        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveLinear, animations: { [weak self] in
            self?.window?.overrideUserInterfaceStyle = theme
        }, completion: .none)
    }
    
}

