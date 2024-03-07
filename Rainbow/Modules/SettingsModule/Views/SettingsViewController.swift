
import UIKit
import SnapKit


final class SettingsViewController: UIViewController {
    
    var presenter: SettingsPresenterProtocol!
    
    var buttonsArray: [UIButton] = []
    lazy var colorButtonsArray =  getButtonColors()
    var standartColors = ColorButtons().colorButtons
    var isOn = false
    
    private lazy var colorPickerView = ColorPickerView()
    private lazy var gameSizeView = SizeView()
    private lazy var gameTimeView = TimeView()
    private lazy var gameSpeedView = SpeedView()
    private lazy var backgroundForWordView = BackgroundForWordView()
    private lazy var backgroundForGameView = BackgroundForGameView()
    private lazy var wordPlacementView = WordPlacementView()
    private lazy var appLangView = AppLangView()
    
    //MARK: - ScrollView
    private lazy var scrollView = UIScrollView()
    
    // MARK: - Main Stack
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        [gameTimeView.shadowView,
         gameSpeedView.shadowView,
         colorPickerView.shadowView,
         gameSizeView.shadowView,
         backgroundForWordView.shadowView,
         backgroundForGameView.shadowView,
         wordPlacementView.shadowView,
         appLangView.shadowView].forEach {
            stack.addArrangedSubview($0)
        }
        return stack
    }()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.getSettings()
        view.addVerticalGradientLayer()
        
        setupViews()
        setupLayout()
        configureNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setAppThemeSwitch()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        presenter?.saveGameSettings(
            durationGame: Int(gameTimeView.gameTimeSlider.value),
            speedGame: Int(gameSpeedView.gameSpeedSlider.value),
            gameColors: colorButtonsArray,
            sizeFont: gameSizeView.gameSizeStepper.value,
            isViewForText: backgroundForWordView.switchedViewForLabel.isOn,
            themeForApp: "customBackground",
            isCenterOnScreen: wordPlacementView.wordPlacementSC.selectedSegmentIndex == 0)
    }
    
    private func configureNavigationBar() {
        navigationController?.setupNavigationBar()
        navigationItem.title = NSLocalizedString("navBarTitle", comment: "")
    }
    
    //MARK: - Alert controller
    func showAlert(title: String, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(defaultAction)
        return alert
    }
    
    // MARK: - Methods UI
    

    
    @objc func stepperValueChanged(sender: UIStepper) {
        gameSizeView.gameSizeStepperLabel.font = UIFont.systemFont(ofSize: sender.value)
    }
    
    @objc func sliderValueChanged(sender: UISlider) {
        let currentValue = Int(sender.value)
        if (sender == gameTimeView.gameTimeSlider) {
            (gameTimeView.gameTimeSliderLabel.text = "\(currentValue)")
        } else {
            (gameSpeedView.gameSpeedSliderLabel.text = "\(currentValue)")
        }
    }
    
    @objc func appThemeSelected(_ sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 1 ){
            print("UISwitch state is now ON")
            UserDefaults.standard.setValue(Theme.dark.rawValue, forKey: "theme")
        }
        else{
            print("UISwitch state is now Off")
            UserDefaults.standard.setValue(Theme.light.rawValue, forKey: "theme")
        }
    }
    
    @objc func changeLangSelected(_ sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 1 ) {
            changeLang(lang: "en-US")
        }
        else {
            changeLang(lang: "ru-RU")
        }
    }
    
    @objc func toggledSwitchValue(_ sender: UISwitch) {}
    
    private func setAppThemeSwitch() {
        let theme = UserDefaults.standard.object(forKey: "theme") as? String
        if theme == "dark" {
            backgroundForGameView.backgroundForGameSC.selectedSegmentIndex = 1
        } else {
            backgroundForGameView.backgroundForGameSC.selectedSegmentIndex = 0
        }
    }
    
    private func changeLang(lang: String) {
        let defaults = UserDefaults.standard
        defaults.set([lang], forKey: "AppleLanguages")
        defaults.synchronize()
        present(showAlert(title: NSLocalizedString("alertTitle", comment: ""), message: NSLocalizedString("langChangeMessage", comment: "")), animated: true)
    }
    
    private func isSelectedLangRu() -> Bool {
        
        if Locale.preferredLanguages[0] == "ru-RU" {
            return true
        } else {
            return false
        }
    }
    
    private func createSettingTitle(title: String) -> UILabel {
        let label = UILabel()
        label.text = title
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    // MARK: - Setup Views
    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(mainStack)
        mainStack.addArrangedSubview(gameTimeView.shadowView)
        mainStack.addArrangedSubview(gameSpeedView.shadowView)
        mainStack.addArrangedSubview(colorPickerView.shadowView)
        mainStack.addArrangedSubview(gameSizeView.shadowView)
        mainStack.addArrangedSubview(backgroundForWordView.shadowView)
        mainStack.addArrangedSubview(backgroundForGameView.shadowView)
        mainStack.addArrangedSubview(wordPlacementView.shadowView)
        mainStack.addArrangedSubview(appLangView.shadowView)
    }
    
    // MARK: - Layout
    private func setupLayout() {
        scrollView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(5)
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        gameTimeView.shadowView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(66)
        }
        
        gameSpeedView.shadowView.snp.makeConstraints { make in
            make.height.equalTo(66)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        colorPickerView.shadowView.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        gameSizeView.shadowView.snp.makeConstraints { make in
            make.height.equalTo(66)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        backgroundForWordView.shadowView.snp.makeConstraints { make in
            make.height.equalTo(66)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        backgroundForGameView.shadowView.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        wordPlacementView.shadowView.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        appLangView.shadowView.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        mainStack.snp.makeConstraints { make in
            make.width.equalToSuperview().offset(-40)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(10)
            make.bottom.equalTo(scrollView.snp.bottom)
        }
    }
}

// MARK: - Extension for SettingsViewProtocol - Methods to update View From Settings
extension SettingsViewController: SettingsViewProtocol {
    
    func getDuration() -> Float {
        guard let settings = presenter.settings else { return 0.3 }
        return Float(settings.durationGame)
    }
    
    func getSpeed() -> Float {
        guard let settings = presenter.settings else { return 0.3 }
        return Float(settings.speedGame)
    }
    
    func getButtonColors() -> [ColorChecker] {
        guard let settings = presenter.settings else { return [] }
        return settings.gameColors
    }
    
    func isViewForText() -> Bool {
        guard let settings = presenter.settings else { return true }
        return settings.isViewForText
    }
    
    func getFontSize() -> Double {
        guard let settings = presenter.settings else { return 15.0 }
        return settings.sizeFont
    }
    
    func getGameBackground() -> String {
        guard let settings = presenter.settings else { return "" }
        return settings.themeForApp
    }
    
    func isRandomLocation() -> Bool {
        guard let settings = presenter.settings else { return true }
        return settings.isCenterOnScreen
    }
}

