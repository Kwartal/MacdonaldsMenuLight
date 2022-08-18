//
//  ViewController.swift
//  TableViewTest
//
//  Created by Богдан Баринов on 18.08.2022.
//

import UIKit
import SnapKit

class MenuViewController: UIViewController {
    
    private var menuItemsArray = MockData.menuItems
    
    //MARK: - UI Elements
    
    private lazy var searchBar: UISearchBar = {
        var searchBar = UISearchBar()
        return searchBar
    }()
    
    private lazy var menuTableView: UITableView = {
        var tableView = UITableView()
        return tableView
    }()
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupSubviews()
        configureConstraints()
    }
    
    private func configureTableView() {
        menuTableView.register(MenuItemTableViewCell.self, forCellReuseIdentifier: MenuItemTableViewCell.identifier)
        menuTableView.delegate = self
        menuTableView.dataSource = self
    }
}
extension MenuViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        menuItemsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
    
}
// MARK: - Layout
extension MenuViewController {
    
    private func addSubviews() {
        view.addSubview(searchBar)
        view.addSubview(menuTableView)
    }
    
    
    private func setupSubviews() {
        view.backgroundColor = .magenta.withAlphaComponent(0.7)
        
        searchBar.placeholder = "Введите название блюда"
        
        
    }
    
    private func configureConstraints() {
        
        searchBar.snp.makeConstraints {
            $0.trailing.leading.equalToSuperview().inset(16)
            $0.top.equalToSuperview().offset(60)
        }
        
        menuTableView.snp.makeConstraints {
            $0.trailing.leading.equalToSuperview().inset(16)
            $0.top.equalTo(searchBar.snp.bottom).offset(26)
            $0.size.equalTo(500)
        }
        
    }
    
    
}
