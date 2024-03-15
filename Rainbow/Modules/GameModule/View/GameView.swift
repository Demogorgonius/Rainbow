
import UIKit
import SnapKit

class GameView: UIView {
    
    // MARK: Properties
    
    lazy var pauseLabel: UILabel = {
        return LabelFactory.createLabel(type: .gameLightGreen, text: NSLocalizedString("pauseLabel", comment: ""))
    }()
    
    lazy var gradientView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customPurple
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.clear.cgColor, UIColor.customBlack.cgColor]
        gradient.locations = [0.0, 1.0]
        view.layer.insertSublayer(gradient, at: 0)
        return view
    }()
    
    lazy var colorButtons: [UIButton] = [
        makeColorButton(backgroundColor: .customLightGreen),
        makeColorButton(backgroundColor: .customDarkGreen),
        makeColorButton(backgroundColor: .customPink),
        makeColorButton(backgroundColor: .customLightBlue),
        makeColorButton(backgroundColor: .customBurgundy),
        makeColorButton(backgroundColor: .customViolet)
    ]
    
    lazy var centerColorButton: UIButton = {
        
        let button = makeColorButton(backgroundColor: .white)
        return button
        
    }()
    
    
    
    // MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
  
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSubviews()
    }
    
    // MARK: Private Methods
    private func setupSubviews() {
        addSubview(gradientView)
        addSubview(centerColorButton)
        addSubviews(pauseLabel)
        let buttonSize = CGSize(width: 50, height: 50)
        pauseLabel.isHidden = true
        pauseLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        centerColorButton.snp.makeConstraints { make in
            make.size.equalTo(buttonSize)
            make.center.equalTo(gradientView)
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-20)
        }
        
        gradientView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(snp.height).multipliedBy(0.000001)
        }
        
        let angleStep = CGFloat.pi / CGFloat(colorButtons.count - 1)
        
        for (index, button) in colorButtons.enumerated() {
            addSubview(button)
            
            let angle = CGFloat.pi + CGFloat(index) * angleStep
            
            let radius: CGFloat = 125.0
            
            button.snp.makeConstraints { make in
                make.size.equalTo(buttonSize)
                make.centerX.equalTo(centerColorButton.snp.centerX).offset(cos(angle) * radius )
                make.centerY.equalTo(centerColorButton.snp.centerY).offset(sin(angle) * radius + 10)
            }
        }
        
    }
    
    private func makeColorButton(backgroundColor: UIColor) -> UIButton {
        let button = ShadowButtonFactory.makeShadowButton(
            backgroundColor: backgroundColor,
            title: "",
            target: self,
            action: nil)
        button.layer.cornerRadius = 25
        return button
    }
}
