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
    
    lazy var clearResultsButton: UIButton = {
        let bt = UIButton()
        bt.setTitle("Очистить статистику", for: .normal)
        bt.setTitleColor(.white, for: .normal)
        bt.backgroundColor = .red
        bt.layer.cornerRadius = 10
    
        return bt
    }()
    
    //MARK: Init
    init(presenter: ResultsPresenterProtocol) {
        self.presenter = presenter
        super.init(style: .plain) 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.RainbowGameColor.customBackground
        registeredCell()
        setupClearResultsButton()
    }
    
    //MARK: Private methods
    private func registeredCell() {
        tableView.separatorStyle = .none
        tableView.rowHeight = 104
        tableView.register(ResultTableViewCell.self, forCellReuseIdentifier: cellID)
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
        2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        guard let resultCell = cell as? ResultTableViewCell else { return UITableViewCell() }
        return resultCell
    }
}

extension ResultsTableViewController: ResultsViewProtocol {
    
}

