
import UIKit

extension UIButton {
    convenience init(imageName: String, target: Any?, action: Selector? ) {
        self.init(frame: .zero)
        setImage(UIImage(named: imageName), for: .normal)
        
        if let target = target, let action = action {
            addTarget(target, action: action, for: .touchUpInside)
        }
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowOpacity = 0.9
        layer.shadowRadius = 3
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalTo: heightAnchor)
        ])
    }
}
