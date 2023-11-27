
import UIKit
import SnapKit

class GameView: UIView {
    // MARK: Properties
    lazy var speedButton: UIButton = {
        let button = ShadowButtonFactory.makeShadowButton(
            backgroundColor: .customRed,
            title: "Speed +",
            target: self,
            action: nil)
        button.layer.cornerRadius = 40
        return button
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
    
    private lazy var colorButtons: [UIButton] = [
        makeColorButton(backgroundColor: .customLightGreen),
        makeColorButton(backgroundColor: .customDarkGreen),
        makeColorButton(backgroundColor: .customPink),
        makeColorButton(backgroundColor: .customLightBlue),
        makeColorButton(backgroundColor: .customBurgundy),
        makeColorButton(backgroundColor: .customViolet)
        
    ]
    
    private lazy var secondColorButtons: [UIButton] = [
        
        makeColorButton(backgroundColor: .customDarkBlue),
        makeColorButton(backgroundColor: .customOrange),
        makeColorButton(backgroundColor: .customRed),
        makeColorButton(backgroundColor: .customYellow),
        makeColorButton(backgroundColor: .customBlack),
        makeColorButton(backgroundColor: .customGrayishPurple)
    ]
    

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
        addSubview(speedButton)

        speedButton.snp.makeConstraints { make in
            make.width.equalTo(80)
            make.height.equalTo(80)
            make.center.equalTo(gradientView)
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-10)
        }

        gradientView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(snp.height).multipliedBy(0.1)
        }

        let buttonSize = CGSize(width: 50, height: 50)

        let angleStep = CGFloat.pi / CGFloat(colorButtons.count - 1)

        for (index, button) in colorButtons.enumerated() {
            addSubview(button)

            let angle = CGFloat.pi + CGFloat(index) * angleStep

            // Calculate the radius for the circular layout
            let radius: CGFloat = 85.0

            button.snp.makeConstraints { make in
                make.size.equalTo(buttonSize)
                make.centerX.equalTo(speedButton.snp.centerX).offset(cos(angle) * radius )
                make.centerY.equalTo(speedButton.snp.centerY).offset(sin(angle) * radius + 10)
            }
        }

        // Create a second row of colorButtons parallel to the first row
        for (index, button) in secondColorButtons.enumerated() {
            addSubview(button)

            let angle = CGFloat.pi + CGFloat(index) * angleStep

            // Adjust the radius for the second row
            let radius: CGFloat = 140.0

            button.snp.makeConstraints { make in
                make.size.equalTo(buttonSize)
                make.centerX.equalTo(speedButton.snp.centerX).offset(cos(angle) * radius)
                make.centerY.equalTo(speedButton.snp.centerY).offset(sin(angle) * radius)
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
