
import UIKit

class ShadowButtonFactory {
    static func makeShadowButton(
        backgroundColor: UIColor,
        title: String?,
        target: Any?,
        action: Selector?
    ) -> UIButton {
        
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = 10
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowOpacity = 0.9
        button.layer.shadowRadius = 3
        button.layer.shadowColor = UIColor.black.cgColor
        
        if let target = target, let action = action {
            button.addTarget(target, action: action, for: .touchUpInside)
        }
        
        return button
    }
}
