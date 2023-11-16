//
//  GameViewController.swift
//  Rainbow
//
//  Created by Liz-Mary on 14.11.2023.
//


import UIKit

class GameViewController: UIViewController {
    
    var presenter: GamePresenter?
    
    var timer = Timer()
    var totalTime: TimeInterval =  15.0
    var secondsPassed = 0.0
 
    
    private var startTime: TimeInterval?
    private var elapsedTime: TimeInterval?
    
    private var timerLabel = UILabel(text: "00:06", font: UIFont.DisplayFont.Regular.size(of: 30))
    var colorViews: [UIView] = []
    var colorLabels: [UILabel] = []
    
    //MARK: LifeCyrcle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .RainbowGameColor.customBackground
        
        navigationItem.title = "Таймер"
        navigationController?.setupNavigationBar()
        addButtons()
        startTimer()
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        if #available(iOS 16.0, *) {
            let pauseBarButton = UIBarButtonItem(title: nil, image: UIImage(systemName: "chevron.backward"), target: self, action: #selector(pauseButtonPressed))
            navigationItem.rightBarButtonItem = pauseBarButton
        } else {
            let pauseBarButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(pauseButtonPressed))
            navigationItem.rightBarButtonItem = pauseBarButton
        }

        
    }
    
    private func setupUI() {
        
    }
    
    private func addButtons() {
        
    }
}

//MARK: GameViewProtocol
extension GameViewController: GameViewProtocol {
  
    func startTimer() {
        timer.invalidate()
        startTime = Date.timeIntervalSinceReferenceDate
        secondsPassed = 0
        timer = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(updateTimer),
            userInfo: nil,
            repeats: true
        )
    }
    
    
    func updateColorViews(colorInfo: [(text: String, backgroundColor: UIColor)]) {
        
    }
    
    func updateTimerLabel(text: String) {
        
    }
    
    //MARK:   @objc func
    @objc func pauseButtonPressed() {
        timer.invalidate()
        elapsedTime = Date.timeIntervalSinceReferenceDate

    }
    
    @objc func speedButtonPressed() {
        
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
        } else {
            print(secondsPassed)
            timer.invalidate()
            let resultScreen = ResultsBuilder.build()
            navigationController?.pushViewController(resultScreen, animated: true)
        }
    }
}
