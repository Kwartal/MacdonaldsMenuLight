//
//  MenuItemViewController.swift
//  TableViewTest
//
//  Created by Богдан Баринов on 18.08.2022.
//

import UIKit

class MenuItemViewController: UIViewController {
    
    private var menuItem: MenuItem
    // MARK: - UI Elements
    
    private lazy var nameLabel = UILabel()
    private lazy var descriptionLabel = UILabel()
    private lazy var itemImageView = UIImageView()
    private lazy var weightLabel = UILabel()
    private lazy var priceLabel = UILabel()
    private lazy var kkalLabel = UILabel()
    private lazy var descriptionView = UIView()

    
    init(menuItem: MenuItem) {
        self.menuItem = menuItem
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupSubviews()
        configureConstraints()
    }
    
}

// MARK: - Layout
extension MenuItemViewController {
    
    private func addSubviews() {
        view.addSubview(nameLabel)
        descriptionView.addSubview(descriptionLabel)
        view.addSubview(itemImageView)
        view.addSubview(weightLabel)
        view.addSubview(priceLabel)
        view.addSubview(kkalLabel)
        view.addSubview(descriptionView)
    }
    
    private func setupSubviews() {
        view.backgroundColor = .white
        itemImageView.image = UIImage(named: menuItem.imageName)
        itemImageView.contentMode = .scaleAspectFit
        
        
        descriptionLabel.text = menuItem.description
        descriptionLabel.numberOfLines = 0
        descriptionView.backgroundColor = .gray.withAlphaComponent(0.1)
        descriptionView.layer.borderWidth = 0.25
        descriptionView.layer.borderColor = UIColor.gray.cgColor
    }
    
    private func configureConstraints() {
        itemImageView.snp.makeConstraints {
            $0.trailing.leading.equalToSuperview()
            $0.size.equalTo(300)
        }
        
        descriptionView.snp.makeConstraints {
            $0.trailing.leading.equalToSuperview()
            $0.top.equalTo(itemImageView.snp.bottom).offset(48)
        }

        descriptionLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }
        
    }
    
}
