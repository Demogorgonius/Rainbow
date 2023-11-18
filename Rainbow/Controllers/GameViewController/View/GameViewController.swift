//
//  GameViewController.swift
//  Rainbow
//
//  Created by Liz-Mary on 14.11.2023.
//

import UIKit
import SnapKit

class GameViewController: UIViewController {
    
    private var presenter: GamePresenterProtocol
    
    var timer = Timer()

    lazy var speedButton: UIButton = {
        let bt = UIButton()
        bt.setTitle("X2", for: .normal)
        bt.setTitleColor(.white, for: .normal)
        bt.backgroundColor = .RainbowGameColor.customRed
        bt.layer.cornerRadius = 36.5
        bt.layer.shadowOffset = CGSize(width: 0, height: 4)
        bt.layer.shadowOpacity = 0.9
        bt.layer.shadowRadius = 3
        bt.layer.shadowColor = UIColor.black.cgColor
        bt.addTarget(self, action: #selector(speedButtonPressed), for: .touchUpInside)
        bt.translatesAutoresizingMaskIntoConstraints = false
        return bt
    }()
    
    //MARK: Init
    init(presenter: GamePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = formattedTime(from: presenter.totalTime)
        navigationController?.setupNavigationBar()
        
        addSubviews()
        startTimer(with: presenter.elapsedTime)
        configureNavigationBar()
        
    }
    
    // MARK: Private Methods
    
    private func configureNavigationBar() {
        let pauseBarButton = UIBarButtonItem(image: UIImage(systemName: "pause.fill"), style: .plain, target: self, action: #selector(pauseButtonPressed))
        navigationItem.rightBarButtonItem = pauseBarButton
    }
    
    private func addSubviews() {
        view.backgroundColor = .RainbowGameColor.customBackground
        view.addSubview(speedButton)
        speedButton.snp.makeConstraints { make in
            make.width.equalTo(73)
            make.height.equalTo(73)
            make.trailing.equalTo(-16)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-34)
        }
    }
    
    private func getRandomColor() -> UIColor {
        guard let colorString = settings?.backgroundForView,
              let color = GameColor(rawValue: colorString)?.getColor() else {
            return .black
        }
        return color
    }
    
    private func generateRandomColorName() -> String {
        let colorNames = ["Красный", "Зеленый", "Голубой", "Желтый", "Оранжевый", "Фиолетовый", "Коричневый", "Розовый"]
        return colorNames.randomElement() ?? "Unknown"
    }
    
    private func formattedTime(from timeInterval: TimeInterval) -> String {
        let minutes = Int(timeInterval) / 60
        let seconds = Int(timeInterval) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    private func addRandomColorView() {
        let randomColor = getRandomColor()
        let colorName = generateRandomColorName()

        let colorView = createColorView(with: randomColor)
        view.addSubview(colorView)  // Добавьте это здесь

        addLabel(to: colorView, with: colorName)

        presenter.colorViews.append(colorView)

        if presenter.isAnswerVerificationEnabled {
            addCheckbox(to: colorView)
        }
    }


    private func createColorView(with color: UIColor) -> UIView {
        let colorView = UIView()
        colorView.backgroundColor = color
        colorView.layer.cornerRadius = 10

        self.view.addSubview(colorView)

        colorView.snp.makeConstraints { make in
            make.width.equalTo(130)
            make.height.equalTo(50)
            make.centerX.equalTo(self.view).offset(CGFloat.random(in: -120...120))
            make.centerY.equalTo(self.view).offset(CGFloat.random(in: -120...120))
        }

        return colorView
    }


    private func addLabel(to colorView: UIView, with text: String) {
        let label = UILabel()
        label.text = text
        label.textColor = .white
        label.textAlignment = .center
        colorView.addSubview(label)

        label.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func addCheckbox(to colorView: UIView) {
        let checkboxButton = UIButton(type: .roundedRect)
        checkboxButton.setImage(UIImage(systemName: "checkmark"), for: .normal)
        checkboxButton.tintColor = .RainbowGameColor.customBlack
        checkboxButton.addTarget(self, action: #selector(checkboxButtonTapped), for: .touchUpInside)
        colorView.addSubview(checkboxButton)

        checkboxButton.snp.makeConstraints { make in
            make.centerY.equalTo(colorView)
            make.leading.equalTo(colorView.snp.trailing).offset(10)
        }
    }

    
    private func startHidingCycle() {
        var index = 0
        let hideInterval = 2.0
        
        Timer.scheduledTimer(withTimeInterval: hideInterval, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            
            guard index < presenter.colorViews.count else {
                index = 0
                return
            }
            
            presenter.colorViews[index].isHidden = true
            index += 1
        }
    }
    
    @objc func checkboxButtonTapped() {
        presenter.updateStatistics(correctAnswer: true)
    }
}

// MARK: GameViewProtocol
extension GameViewController: GameViewProtocol {

    internal func startTimer(with elapsedTime: TimeInterval?) {
        timer.invalidate()
        presenter.startTime = Date()
        
        if let elapsedTime = elapsedTime {
            presenter.startTime = presenter.startTime?.addingTimeInterval(-elapsedTime)
        }
        
        timer = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(updateTimer),
            userInfo: nil,
            repeats: true
        )
    }
    
    // MARK: @objc func
    @objc func pauseButtonPressed() {
        if timer.isValid {
            presenter.elapsedTime = Date().timeIntervalSince(presenter.startTime ?? Date())
            timer.invalidate()
            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "play.fill")
        } else {
            startTimer(with: presenter.elapsedTime)
            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "pause.fill")
        }
    }
    
    @objc func speedButtonPressed() {
        
    }
    
    // MARK: @objc func
    @objc func updateTimer() {
        guard let startTime = presenter.startTime else { return }
        let elapsedTime = Date().timeIntervalSince(startTime)
        let remainingTime = max(presenter.totalTime - elapsedTime, 0)
        navigationItem.title = formattedTime(from: remainingTime)
        
        
        if Int(elapsedTime) % 2 == 0 {
            addRandomColorView()
            startHidingCycle()
        }
        
        
        if elapsedTime >= presenter.totalTime {
            timer.invalidate()
            let resultScreen = ResultsBuilder.build()
            navigationController?.pushViewController(resultScreen, animated: true)

        }
    }
}
