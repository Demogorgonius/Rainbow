//
//  GameViewController.swift
//  Rainbow
//
//  Created by Liz-Mary on 14.11.2023.
//


import UIKit
import SnapKit

class GameViewController: UIViewController {
    
    var presenter: GamePresenter?
    
    var timer = Timer()
    var totalTime: TimeInterval = 15.0
    var startTime: Date?
    
    private var elapsedTime: TimeInterval?
    
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
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = formattedTime(from: totalTime)
        navigationController?.setupNavigationBar()
        
        addSubviews()
        startTimer(with: elapsedTime)
        configureNavigationBar()
    }
    
    // MARK: Private Methods
    
    private func configureNavigationBar() {
        let pauseBarButton = UIBarButtonItem(image: UIImage(named: "pause"), style: .plain, target: self, action: #selector(pauseButtonPressed))
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
}

// MARK: GameViewProtocol
extension GameViewController: GameViewProtocol {
    func updateUI() {
        //
    }
    
    
    internal func startTimer(with elapsedTime: TimeInterval?) {
            timer.invalidate()
            startTime = Date()
            
            if let elapsedTime = elapsedTime {
                startTime = startTime?.addingTimeInterval(-elapsedTime)
            }
            
            timer = Timer.scheduledTimer(
                timeInterval: 1.0,
                target: self,
                selector: #selector(updateTimer),
                userInfo: nil,
                repeats: true
            )
        }
    
    func updateColorViews(colorInfo: [(text: String, backgroundColor: UIColor)]) {
        // Update colors if needed
    }
    
    func updateTimerLabel(text: String) {
        // Update timer label if needed
    }
    
    // MARK: @objc func
    @objc func pauseButtonPressed() {
        if timer.isValid {
            elapsedTime = Date().timeIntervalSince(startTime ?? Date())
            timer.invalidate()
                navigationItem.rightBarButtonItem?.image = UIImage(systemName: "play")
        } else {
            startTimer(with: elapsedTime)
                navigationItem.rightBarButtonItem?.image = UIImage(named: "pause")
        }
    }
    
    @objc func speedButtonPressed() {
        // Handle speed button press if needed
    }
    
    @objc func updateTimer() {
        guard let startTime = startTime else { return }
        let elapsedTime = Date().timeIntervalSince(startTime)
        let remainingTime = max(totalTime - elapsedTime, 0)
        navigationItem.title = formattedTime(from: remainingTime)
        
        if elapsedTime >= totalTime {
            timer.invalidate()
            let resultScreen = ResultsBuilder.build()
            if #available(iOS 16.0, *) {
                resultScreen.navigationItem.leftBarButtonItem?.isHidden = true
            } else {
                // Fallback on earlier versions
            }
            navigationController?.pushViewController(resultScreen, animated: true)
        }
    }
}
