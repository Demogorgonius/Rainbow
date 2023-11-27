
import UIKit

protocol RainbowViewManagerProtocol {
    var roundPoints: Int { get set }
    func getRandomRainbowView() -> RainbowView
}

final class RainbowViewManager: RainbowViewManagerProtocol {
    var roundPoints = 0
    var settings: GameSettings
    
    private let settingManager: SettingManagerProtocol = SettingsManager()
    
    private let colorNames = [
        "Красный",
        "Синий",
        "Зеленый",
        "Голубой",
        "Желтый",
        "Оранжевый",
        "Фиолетовый",
        "Коричневый",
        "Розовый"
    ]
    
    init(settings: GameSettings) {
        self.settings = settings
    }
    
    private func getRandomGameModel() -> GameModel {

        if settings.isViewForText {
            
            let shuffledColors = getColorTextShuffle()
            let text = shuffledColors.randomElement() ?? "Желтый"
            let textColor = UIColor.white
            let fontSize = CGFloat(settings.sizeFont )
            let rainbowViewColor = getColorFromButtons()
                .randomElement()
            ?? .customDarkBlue
            
            return GameModel(
                text: text,
                textColor: textColor,
                fontSize: fontSize,
                rainbowViewColor: rainbowViewColor
                )
        } else {
            let shuffledColors = getColorTextShuffle()
            let text = shuffledColors.randomElement() ?? ""
            let textColor = getColorFromButtons()
                .randomElement()
                ?? .customDarkBlue
            let fontSize = CGFloat(settings.sizeFont)
            let rainbowViewColor = UIColor.clear
            
            return GameModel(
                text: text,
                textColor: textColor,
                fontSize: fontSize,
                rainbowViewColor: rainbowViewColor
                )
        }
    }

    func getRandomRainbowView() -> RainbowView {
        let gameModel = getRandomGameModel()
        let rainbowView = RainbowView()
        rainbowView.update(gameModel)
        return rainbowView
    }
    
    private func getColorTextShuffle() -> [String] {
        var colorNamesShuffle: [String] = []
        colorNamesShuffle.append(contentsOf: colorNames.shuffled())
        return colorNamesShuffle
    }
    
    private func getColorFromButtons() -> [UIColor] {

        let colorButtons = settings.gameColors
        var colors: [UIColor] = []
        for button in colorButtons {
            if button.isOn {
                if let color = UIColor(named: button.color) {
                    colors.append(color)
                }
            }
        }
        return colors
    }
    
    private func getSettings() {
        settingManager.getSettings(completion: { result in
            switch result {
            case .success(let settings):
                self.settings = settings
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
}
