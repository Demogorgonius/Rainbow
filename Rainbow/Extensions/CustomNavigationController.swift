
import UIKit

extension UINavigationController {
    func setupNavigationBar() {
        setBackButtonAppearance()
        configureNavigationBarAppearance()
    }

    private func setBackButtonAppearance() {
        let backButtonImage = UIImage(systemName: "arrow.backward")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 45, weight: .bold))
        let alignInsets = UIEdgeInsets(top: 19, left: -4, bottom: 0, right: 0)
        
        navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationBar.backIndicatorImage = backButtonImage?.withAlignmentRectInsets(alignInsets)
        navigationBar.backIndicatorTransitionMaskImage = backButtonImage
        navigationBar.tintColor = .customPeach
        
    }


    private func configureNavigationBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .customPurple.withAlphaComponent(0.5)
        appearance.titleTextAttributes = [
            .font: UIFont.boldSystemFont(ofSize: 20),
            .foregroundColor: UIColor.customPeach]
        navigationBar.standardAppearance = appearance
        navigationBar.compactAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
        navigationBar.compactScrollEdgeAppearance = appearance
    }
    
}
