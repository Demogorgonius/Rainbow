
import UIKit

// Протокол для вью
protocol ContenableView {
    var shadowView: UIView { get }
}

// Реализация протокола для базового вида
extension UIView: ContenableView {
    var shadowView: UIView {
        return self
    }
}

// Фабрика для создания вью с тенью
class ViewFactory {
    static func createShadowView() -> ContenableView {
        let containerView = UIView()
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        let backgroundImageView = UIImageView(image: UIImage(named: "backgroundForView"))
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        backgroundImageView.layer.cornerRadius = 15
        backgroundImageView.layer.borderWidth = 1
        containerView.insertSubview(backgroundImageView, at: 0)
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalTo(containerView)
        }
        
        // Add blur effect
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.alpha = 0.9
        blurEffectView.frame = containerView.bounds
        containerView.addSubview(blurEffectView)
        
        // Add vibrancy effect
        let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
        let vibrancyView = UIVisualEffectView(effect: vibrancyEffect)
        vibrancyView.frame = containerView.bounds
        blurEffectView.contentView.addSubview(vibrancyView)
        
        // Add shadow to containerView
        containerView.layer.shadowOffset = CGSize(width: 0, height: 6)
        containerView.layer.shadowOpacity = 0.9
        containerView.layer.shadowRadius = 3
        containerView.layer.shadowColor = UIColor.black.cgColor
        
        return containerView
    }
}
