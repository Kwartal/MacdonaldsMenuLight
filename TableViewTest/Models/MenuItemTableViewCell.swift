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
        contentView.backgroundColor = .black
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
    }
    
    private func configureConstraints() {
        
        menuItemTitleLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 16, left: 87, bottom: 16, right: 64))
        }
        
        menuItemImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.size.equalTo(18)
            $0.leading.equalTo(menuItemTitleLabel.snp.trailing).offset(17)
        }
        
    }
}
/*
final class ItemMeasureTableViewCell: UITableViewCell {
    
    static let identifier = "ItemMeasureTableViewCell"

    // MARK: - UI Elements

    private lazy var itemMeasureImageView = UIImageView(image: UIImage(named: "itemMeasure123"))
    private lazy var redAttentionImageView = UIImageView(image: UIImage(named: "attention"))
    private lazy var actualWeightLabel = UILabel()
    private lazy var arrowRightImageView = UIImageView(image: UIImage(named: "arrowRightWhite"))


    // MARK: - Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        selectionStyle = .none
        contentView.backgroundColor = .black
        setupSubviews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(dataSource: String?) {
        // TODO: здесь будет определяться показывать redAttention или нет. А так же текст лейбла Фактическая масса, Фактическое количество, Фактический обьем
        
        // example: Фактическое количество - 10 шт. Attention скрыт
    }

}

// MARK: - Layout

extension ItemMeasureTableViewCell {

    private func setupSubviews() {
        actualWeightLabel.text = t_actualWeight
        actualWeightLabel.textColor = .white
        contentView.addSubviews(itemMeasureImageView, redAttentionImageView, actualWeightLabel, arrowRightImageView)
        configureConstraints()
    }

    private func configureConstraints() {
        itemMeasureImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.size.equalTo(24)
            $0.leading.equalToSuperview().inset(16)
        }
        
        redAttentionImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.size.equalTo(18)
            $0.leading.equalTo(itemMeasureImageView.snp.trailing).offset(17)
        }
        
        actualWeightLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 16, left: 87, bottom: 16, right: 64))
        }
        
        arrowRightImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.size.equalTo(42)
            $0.trailing.equalToSuperview().inset(6)
        }
    }


}
*/
