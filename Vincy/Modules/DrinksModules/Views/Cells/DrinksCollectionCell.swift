//
//  DrinksCollectionCell.swift
//  Vincy
//
//  Created by Максим Гурков on 28.08.2023.
//

import UIKit

final class DrinksCollectionCell: UICollectionViewCell {
    
    static let id = "drinksCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.tintColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .brown
        layer.cornerRadius = 12
        setupCell()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        addSubview(titleLabel)
    }
    
    func fill(text: String) {
        titleLabel.text = text
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10)
            
        ])
    }
    
}
