
import UIKit.UIView

extension UIView {
    func addAutoLayoutSubview(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
    }
    
    func addAutoLayoutSubviews(_ views: UIView...) {
        views.forEach { addAutoLayoutSubview($0) }
    }
    
    func addSubviews(_ views: UIView...) {
        views.forEach({
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        })
    }
    
    // градиент
    func addAnimatedGradientLayer() {
          let primaryColor = UIColor(
              red: 210/255,
              green: 109/255,
              blue: 128/255,
              alpha: 1
          ).cgColor
          
          let middleColor = UIColor(
              red: 59/255,
              green: 89/255,
              blue: 152/255,
              alpha: 1.0
          ).cgColor
          
          let secondaryColor = UIColor(
              red: 107/255,
              green: 148/255,
              blue: 200/255,
              alpha: 1.0
          ).cgColor
          
          let gradient = CAGradientLayer()
          gradient.frame = bounds
          gradient.colors = [primaryColor, middleColor, secondaryColor]
          gradient.locations = [0.0, 0.33, 0.66, 1.0]
          gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
          gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
          layer.insertSublayer(gradient, at: 0)
          
          let animation = CABasicAnimation(keyPath: "colors")
          animation.fromValue = [primaryColor, middleColor, secondaryColor]
          animation.toValue = [secondaryColor, middleColor, primaryColor]
          animation.duration = 2.0
          animation.autoreverses = true
          animation.repeatCount = .infinity
          gradient.add(animation, forKey: "gradientAnimation")
      
  }
}
