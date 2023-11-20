//
//  ResultsTableViewController.swift
//  Rainbow
//
//  Created by Келлер Дмитрий on 13.11.2023.
//

import UIKit
import SnapKit

final class ResultsTableViewController: UITableViewController {
    
    //MARK: Properties
    
    private let presenter: ResultsPresenterProtocol
    
    private let cellID = "cell"
    
    private lazy var clearResultsButton: UIButton = {
        let button = ShadowButtonFactory.makeShadowButton(
            backgroundColor: .RainbowGameColor.customRed,
            title: "Очистить статистику",
            target: self,
            action: #selector(clearResultsButtonTap))
        return button
    }()
    
    //MARK: Init
    init(presenter: ResultsPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.RainbowGameColor.customBackground
        configureTableView()
        setupClearResultsButton()
        
        configureNavigationBar()
        
        
    }
    //MARK: Private methods
    private func configureNavigationBar() {
        navigationController?.setupNavigationBar()
        navigationItem.hidesBackButton = true
        navigationItem.title = "Статистика"
        
        let exitBarButton = UIBarButtonItem(image: UIImage(systemName: "xmark", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .bold)), style: .plain, target: self, action: #selector(exitButtonPressed))
        navigationItem.rightBarButtonItem = exitBarButton
    }
    
    @objc private func exitButtonPressed() {
        let startScreen = MainBuilder.build()
        navigationController?.setViewControllers([startScreen], animated: true)
    }
    
    @objc private func clearResultsButtonTap() {
        presenter.clearStatisticOverview()
        UIView.transition(with: tableView, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.tableView.reloadData()
        }, completion: nil)
    }
    
    private func configureTableView() {
        tableView.separatorStyle = .none
        tableView.rowHeight = 104
        tableView.register(ResultTableViewCell.self, forCellReuseIdentifier: cellID)
        
        tableView.contentInset = UIEdgeInsets(top: 30, left: 0, bottom: -150, right: 0)
    }
    
    
    private func setupClearResultsButton() {
        view.addSubview(clearResultsButton)
        
        clearResultsButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-63)
            make.height.equalTo(63)
            make.width.equalTo(268)
        }
    }
    
    //MARK: UITableViewDelegate, UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.resultStorage.results.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        guard let resultCell = cell as? ResultTableViewCell else { return UITableViewCell() }
        
        let result = presenter.resultStorage.results[indexPath.row]
        
        resultCell.configure(with: result)
        return resultCell
    }
}

extension ResultsTableViewController: ResultsViewProtocol {
    
}

