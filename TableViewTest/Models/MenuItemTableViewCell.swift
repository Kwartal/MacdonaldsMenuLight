//
//  MenuItemTableViewCell.swift
//  TableViewTest
//
//  Created by Богдан Баринов on 18.08.2022.
//

import Foundation
import UIKit


final class MenuItemTableViewCell: UITableViewCell {
    
    static let identifier = "MenuItemTableViewCell"
    
    // MARK: - UI Elements
    private lazy var menuItemTitleLabel = UILabel()
    private lazy var menuItemImageView = UIImageView()
    
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.backgroundColor = .white
        setupSubviews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Заполняем из модели MenuItem
    func configureWithViewModel(menuItem: MenuItem) {
        self.menuItemTitleLabel.text = menuItem.name
        self.menuItemImageView.image = UIImage(named: menuItem.imageName)
    }
}

// MARK: - Layout

extension MenuItemTableViewCell {
    
    private func setupSubviews() {
        contentView.addSubview(menuItemTitleLabel)
        contentView.addSubview(menuItemImageView)
        configureConstraints()
        menuItemImageView.contentMode = .scaleAspectFit
        menuItemTitleLabel.font = .systemFont(ofSize: 25, weight: .semibold)
    }
    
    private func configureConstraints() {
        
        menuItemTitleLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 16, left: 150, bottom: 16, right: 64))
        }
        
        menuItemImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.size.equalTo(80)
            $0.leading.equalToSuperview().offset(16)
        }
    }
}
