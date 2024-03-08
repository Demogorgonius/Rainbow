
import UIKit
import SnapKit


final class SettingsViewController: UIViewController {
    
    var presenter: SettingsPresenterProtocol!
    
    var buttonsArray: [UIButton] = []
    lazy var colorButtonsArray =  getButtonColors()
    var standartColors = ColorButtons().colorButtons
    var isOn = false
    var isExpanded = false
    
    private lazy var colorPickerView = ColorPickerView()
    private lazy var sizeView = SizeView()
    private lazy var timeView = TimeView()
    private lazy var speedView = SpeedView()
    private lazy var backgroundForWordView = BackgroundForWordView()
    private lazy var themePickerView = ThemePickerView()
    private lazy var wordPlacementView = WordPlacementView()
    private lazy var appLangView = AppLangView()
    
    private lazy var allViews =  [timeView,
                                  speedView,
                                  colorPickerView,
                                  sizeView,
                                  backgroundForWordView,
                                  themePickerView,
                                  wordPlacementView,
                                  appLangView
    ]
    
    //MARK: - ScrollView
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Main Stack
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        allViews.forEach {
            stack.addArrangedSubview($0)
        }
        return stack
    }()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        presenter.getSettings()
        view.addVerticalGradientLayer()
        
        setupViews()
        setupLayout()
        setupButtons()
        addTargetFromViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setAppThemeSwitch()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        presenter?.saveGameSettings(
            durationGame: Int(timeView.gameTimeSlider.value),
            speedGame: Int(speedView.gameSpeedSlider.value),
            gameColors: colorButtonsArray,
            sizeFont: sizeView.gameSizeStepper.value,
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
    
    // MARK: - addTarget
    private func addTargetFromViews() {
        setupSizeView()
        setupColorPickerView()
        setupTimeView()
        setupSpeedView()
        setupBackgroundForWordView()
        setupThemePickerView()
        setupWordPlacementView()
        setupAppLangView()
    }

    private func setupSizeView() {
        sizeView.gameSizeStepper.addTarget(self, action: #selector(stepperValueChanged), for: .valueChanged)
        sizeView.gameSizeStepper.value = getFontSize()
    }

    private func setupColorPickerView() {
        colorPickerView.mainPickerStack.isHidden = true
        colorPickerView.colorPickerButton.addAction(UIAction { [weak self] _ in
            self?.colorPickerButtonTap()
        }, for: .touchUpInside)
    }

    private func setupTimeView() {
        timeView.gameTimeSlider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        timeView.gameTimeSlider.setValue(getDuration(), animated: true)
        timeView.gameTimeSlider.minimumValue = 1.0
        timeView.gameTimeSlider.maximumValue = 20.0
    }

    private func setupSpeedView() {
        speedView.gameSpeedSlider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        speedView.gameSpeedSlider.setValue(getSpeed(), animated: true)
    }

    private func setupBackgroundForWordView() {
        backgroundForWordView.switchedViewForLabel.isOn = presenter.settings?.isViewForText ?? false
        backgroundForWordView.switchedViewForLabel.addTarget(self, action: #selector(toggledSwitchValue), for: .valueChanged)
    }

    private func setupThemePickerView() {
        themePickerView.themePickerSegmentedControl.addTarget(self, action: #selector(appThemeSelected), for: .valueChanged)
    }

    private func setupWordPlacementView() {
        wordPlacementView.wordPlacementSC.selectedSegmentIndex = isRandomLocation() ? 0 : 1
    }

    private func setupAppLangView() {
        appLangView.appLangSegmentedControl.selectedSegmentIndex = isSelectedLangRu() ? 0 : 1
        appLangView.appLangSegmentedControl.addTarget(self, action: #selector(changeLangSelected), for: .valueChanged)
    }
    
    // MARK: - Methods UI

   private func setupButtons() {
        var button = UIButton()
        colorButtonsArray = getButtonColors()
        
        for i in 0...11 {
            button = createButton(color: colorButtonsArray[i].color)
            
            setBackground(view: button, onOffStatus: colorButtonsArray[i].isOn)
            button.addTarget(self, action: #selector(checkboxTaped), for: .touchUpInside)
            button.tag = i
            buttonsArray.append(button)
            i < 6 ? colorPickerView.colorPickerButtonStack1.addArrangedSubview(button) : colorPickerView.colorPickerButtonStack2.addArrangedSubview(button)
        }
    }
    
    private func setBackground(view: UIButton, onOffStatus: Bool) {
        let whiteCheck = UIImage(named: "checkboxWhire")!
        let blackCheck = UIImage(named: "checkboxBlack")!
        switch onOffStatus {
        case true:
            view.backgroundColor == .customBlack ? view.setImage(whiteCheck, for: .normal) : view.setImage(blackCheck, for: .normal)
        default:
            view.setImage(nil, for: .normal)
        }
    }
    
    private func createButton(color: String) -> UIButton {
        let button = UIButton()
        button.backgroundColor = UIColor(named: color)
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        button.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        return button
    }
    
    @objc private func checkboxTaped(sender: UIButton) {
        colorButtonsArray[sender.tag].isOn.toggle()
        setBackground(view: sender, onOffStatus: colorButtonsArray[sender.tag].isOn)
    }
    
    @objc private func stepperValueChanged(sender: UIStepper) {
        sizeView.gameSizeStepperLabel.font = UIFont.systemFont(ofSize: sender.value)
    }
    
    @objc private func sliderValueChanged(sender: UISlider) {
        let currentValue = Int(sender.value)
        if (sender == timeView.gameTimeSlider) {
            (timeView.gameTimeSliderLabel.text = "\(currentValue)")
        } else {
            (speedView.gameSpeedSliderLabel.text = "\(currentValue)")
        }
    }
    
    @objc private func appThemeSelected(_ sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 1 ){
            print("UISwitch state is now ON")
            UserDefaults.standard.setValue(Theme.dark.rawValue, forKey: "theme")
        }
        else{
            print("UISwitch state is now Off")
            UserDefaults.standard.setValue(Theme.light.rawValue, forKey: "theme")
        }
    }
    
    @objc private func changeLangSelected(_ sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 1 ) {
            changeLang(lang: "en-US")
        }
        else {
            changeLang(lang: "ru-RU")
        }
    }
    
    @objc private func toggledSwitchValue(_ sender: UISwitch) {}
    
    private func setAppThemeSwitch() {
        let theme = UserDefaults.standard.object(forKey: "theme") as? String
        if theme == "dark" {
            themePickerView.themePickerSegmentedControl.selectedSegmentIndex = 1
        } else {
            themePickerView.themePickerSegmentedControl.selectedSegmentIndex = 0
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
    
    private func colorPickerButtonTap() {
        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let self = self else { return }
            if self.isExpanded == false {
                colorPickerView.mainPickerStack.isHidden = false
                self.colorPickerView.snp.remakeConstraints { make in
                    make.height.equalTo(250)
                    make.leading.trailing.equalToSuperview().inset(20)
                }
            } else {
                colorPickerView.mainPickerStack.isHidden = true
                self.colorPickerView.snp.remakeConstraints { make in
                    make.height.equalTo(50)
                    make.leading.trailing.equalToSuperview().inset(20)
                }
            }
            self.view.layoutIfNeeded()
            self.isExpanded.toggle()
        }
    }
    
    // MARK: - Setup Views
    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(mainStack)
        
        allViews.forEach {
            mainStack.addArrangedSubview($0)
        }
    }
    
    // MARK: - Layout
    private func setupLayout() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.width.equalToSuperview()
            make.height.equalTo(mainStack)
        }
        
        mainStack.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(16)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        timeView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(66)
        }
        
        speedView.snp.makeConstraints { make in
            make.height.equalTo(66)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        colorPickerView.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        sizeView.snp.makeConstraints { make in
            make.height.equalTo(66)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        backgroundForWordView.snp.makeConstraints { make in
            make.height.equalTo(66)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        themePickerView.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        wordPlacementView.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        appLangView.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }
}



