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
        let button = ShadowButtonFactory.makeShadowButton(
            backgroundColor: .RainbowGameColor.customRed,
            title: "X2",
            target: self,
            action: #selector(speedButtonPressed))
        return button
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
        
        
        getSettings()
        navigationItem.title = formattedTime(from: TimeInterval(presenter.settings?.durationGame ?? 15))
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
        speedButton.frame = CGRect(x: 0, y: 0, width: 73, height: 73)
        speedButton.snp.makeConstraints { make in
            make.width.equalTo(73)
            make.height.equalTo(73)
            make.trailing.equalTo(-16)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-34)
            
            speedButton.layer.cornerRadius = speedButton.frame.size.height / 2
        }
    }
    
    private func formattedTime(from timeInterval: TimeInterval) -> String {
        let minutes = Int(timeInterval) / 60
        let seconds = Int(timeInterval) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
}


// MARK: GameViewProtocol
extension GameViewController: GameViewProtocol {
    func getSettings() {
        presenter.getSettings()
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
        // Handle speed button press if needed
    }
    
    // MARK: @objc func
    @objc func updateTimer() {
        guard let startTime = presenter.startTime else { return }
        let elapsedTime = Date().timeIntervalSince(startTime)
        let remainingTime = max(TimeInterval(presenter.settings?.durationGame ?? 15) - elapsedTime, 0)
        navigationItem.title = formattedTime(from: remainingTime)
        
        if elapsedTime >= TimeInterval(presenter.settings?.durationGame ?? 15) {
            timer.invalidate()
            
            presenter.gameManager.addStatistic(.init(
                numberGame: presenter.numberGame + 1,
                durationGame: presenter.settings?.durationGame ?? 0,
                speedGame: presenter.settings?.speedGame ?? 0,
                resultGame: "3/4")
            )
            presenter.routeToResultScreen()
        }
    }
}
