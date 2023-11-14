//
//  ResultsTableViewController.swift
//  Rainbow
//
//  Created by Келлер Дмитрий on 13.11.2023.
//

import UIKit

final class ResultsTableViewController: UITableViewController {
    
    //MARK: Properties
    private let cellID = "cell"
    
    lazy var clearedResultButton: UIButton = {
        let bt = UIButton()
        bt.setTitle("Очистить статистику", for: .normal)
        bt.setTitleColor(.white, for: .normal)
        bt.backgroundColor = .red
        bt.layer.cornerRadius = 10
        
        bt.translatesAutoresizingMaskIntoConstraints = false
        return bt
    }()
    
    //MARK: Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        registeredCell()
        setupClearedResultButton()
    }
    
    //MARK: Private methods
    private func registeredCell() {
        tableView.separatorStyle = .none
        tableView.rowHeight = 104
        tableView.register(ResultTableViewCell.self, forCellReuseIdentifier: cellID)
    }
    
    private func setupClearedResultButton() {
        view.addSubview(clearedResultButton)
        
        NSLayoutConstraint.activate([
            clearedResultButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            clearedResultButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -63),
            clearedResultButton.heightAnchor.constraint(equalToConstant: 63),
            clearedResultButton.widthAnchor.constraint(equalToConstant: 268)
        ])
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

