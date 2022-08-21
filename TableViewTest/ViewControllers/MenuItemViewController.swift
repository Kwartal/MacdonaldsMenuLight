//
//  MenuItemViewController.swift
//  TableViewTest
//
//  Created by Богдан Баринов on 18.08.2022.
//

import UIKit

final class MenuItemViewController: UIViewController {
    
    private var menuItem: MenuItem
    // MARK: - UI Elements
    
    private lazy var nameLabel = UILabel()
    private lazy var descriptionLabel = UILabel()
    private lazy var itemImageView = UIImageView()
    private lazy var weightLabel = UILabel()
    private lazy var priceLabel = UILabel()
    private lazy var kkalLabel = UILabel()
    private lazy var descriptionView = UIView()
    private lazy var addButton = UIButton()
    private lazy var itemCounterView = UIView()
    private lazy var minusNumberOfItemButton = UIButton()
    private lazy var plusNumberOfItemButton = UIButton()
    private lazy var currentNumberItemLabel = UILabel()
    

    
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
        print("privet")
      
    }
    
    @objc func numbersOfItemButtonDidTap(sender: UIButton) {
        guard var currentValue = Int(currentNumberItemLabel.text ?? "0") else { return }

        if sender == minusNumberOfItemButton && currentValue > 0 {
            currentValue -= 1
        } else if sender == plusNumberOfItemButton {
            currentValue += 1
        } else if currentValue == 0 {
            currentNumberItemLabel.textColor = .gray.withAlphaComponent(0.3)
        }
        currentNumberItemLabel.text = String(currentValue)
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
        view.addSubview(addButton)
        
        view.addSubview(itemCounterView)
        itemCounterView.addSubview(minusNumberOfItemButton)
        itemCounterView.addSubview(plusNumberOfItemButton)
        itemCounterView.addSubview(currentNumberItemLabel)
    }
    
    private func setupSubviews() {
        view.backgroundColor = .white
        itemImageView.image = UIImage(named: menuItem.imageName)
        itemImageView.contentMode = .scaleAspectFit
        
        descriptionLabel.text = menuItem.description
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = .gray
        
        
        descriptionView.backgroundColor = .gray.withAlphaComponent(0.1)
        descriptionView.layer.borderWidth = 0.25
        descriptionView.layer.borderColor = UIColor.gray.cgColor
        
        
        nameLabel.text = menuItem.name
        nameLabel.textColor = .black.withAlphaComponent(0.9)
        
        
        
        weightLabel.text = menuItem.weight
        weightLabel.textColor = .gray
        
        priceLabel.text = menuItem.price
        priceLabel.textColor = .black.withAlphaComponent(0.9)
        
        kkalLabel.text = menuItem.kkal
        kkalLabel.textColor = .gray
        
        addButton.backgroundColor = .systemYellow.withAlphaComponent(0.6)
        addButton.setTitle("Добавить", for: .normal)
        addButton.setTitleColor(.black, for: .normal)
        addButton.layer.cornerRadius = 10
        
        itemCounterView.backgroundColor = .gray.withAlphaComponent(0.3)
        itemCounterView.layer.cornerRadius = 10
        
        minusNumberOfItemButton.setTitle("-", for: .normal)
        minusNumberOfItemButton.titleLabel?.font = .systemFont(ofSize: 25, weight: .bold)
        minusNumberOfItemButton.addTarget(self, action: #selector(numbersOfItemButtonDidTap(sender:)), for: .touchUpInside)
        
        plusNumberOfItemButton.setTitle("+", for: .normal)
        plusNumberOfItemButton.titleLabel?.font = .systemFont(ofSize: 25, weight: .bold)
        plusNumberOfItemButton.addTarget(self, action: #selector(numbersOfItemButtonDidTap(sender:)), for: .touchUpInside)
        
        currentNumberItemLabel.text = "1"
        currentNumberItemLabel.textColor = .white
        currentNumberItemLabel.font = .systemFont(ofSize: 20, weight: .bold)
        currentNumberItemLabel.textAlignment = .center
    }
    
    private func configureConstraints() {
        itemImageView.snp.makeConstraints {
            $0.trailing.leading.equalToSuperview()
            $0.size.lessThanOrEqualTo(UIScreen.main.bounds.width * 0.7)
        }
        
        descriptionView.snp.makeConstraints {
            $0.trailing.leading.equalToSuperview()
            $0.top.equalTo(itemImageView.snp.bottom).offset(48)
        }

        descriptionLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }
        
        nameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.top.equalTo(descriptionView.snp.bottom).offset(14)
        }
        
        weightLabel.snp.makeConstraints {
            $0.leading.equalTo(nameLabel.snp.trailing).offset(6)
            $0.top.equalTo(nameLabel)
        }
        
        priceLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(nameLabel)
        }
        
        kkalLabel.snp.makeConstraints {
            $0.leading.equalTo(weightLabel.snp.trailing).offset(6)
            $0.top.equalTo(weightLabel)
        }
        // FIXME: - исправить ширину кнопки
        addButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.leading.equalToSuperview().offset(130)
            $0.top.equalTo(priceLabel.snp.bottom).offset(20)
            $0.height.equalTo(50)
        }
        
        itemCounterView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalTo(addButton.snp.leading).inset(-16)
            $0.top.equalTo(addButton)
            $0.height.equalTo(addButton)
        }
        
        minusNumberOfItemButton.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview().inset(8)
            $0.width.equalTo(30)
        }
        
        currentNumberItemLabel.snp.makeConstraints {
            $0.leading.equalTo(minusNumberOfItemButton.snp.trailing)
            $0.trailing.equalTo(plusNumberOfItemButton.snp.leading)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(30)

        }
        
        plusNumberOfItemButton.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.trailing.equalToSuperview().inset(8)
            $0.width.equalTo(30)
        }
        
    }
    
}
