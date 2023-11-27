
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
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowOpacity = 0.9
        view.layer.shadowRadius = 3
        view.layer.shadowColor = UIColor.black.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}

