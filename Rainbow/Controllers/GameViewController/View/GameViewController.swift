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
        addRandomColorView()
        
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
    
    private func formattedTime(from timeInterval: TimeInterval) -> String {
        let minutes = Int(timeInterval) / 60
        let seconds = Int(timeInterval) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    
    @objc func checkboxButtonTapped() {
        presenter.updateStatistics(correctAnswer: true)
    }
}

// MARK: GameViewProtocol
extension GameViewController: GameViewProtocol {
    
    private func addRandomColorView() {
        presenter.addRandomColorView()
    }

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
            presenter.addRandomColorView()
            presenter.startHidingCycle()
        }
        
        if elapsedTime >= presenter.totalTime {
            timer.invalidate()
            presenter.resultStorage.addStatistic(
                .init(
                    numberGame: presenter.numberGame,
                    durationGame: presenter.totalTime ,
                    speedGame: 4,
                    resultGame: "3/4"
                )
            )
            presenter.numberGame += 1
            let resultScreen = ResultsBuilder.build()
            navigationController?.pushViewController(resultScreen, animated: true)

        }
    }

    func addColorView(_ view: UIView) {
        self.view.addSubview(view)
        view.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.centerX.equalTo(self.view).offset(CGFloat.random(in: -140...140))
            make.centerY.equalTo(self.view).offset(CGFloat.random(in: -140...140))
        }
    }
}
