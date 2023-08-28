//
//  DrinksCollectionCell.swift
//  Vincy
//
//  Created by Максим Гурков on 28.08.2023.
//

import UIKit

final class DrinksCollectionCell: UICollectionViewCell {
    
    static let id = "drinksCell"
    
    private let drinkImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Капучино")
        image.layer.masksToBounds = true
        image.contentMode = .scaleToFill
        image.layer.cornerRadius = 10
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.tintColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let liteImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "250")
        image.layer.masksToBounds = true
        image.contentMode = .scaleToFill
        image.layer.cornerRadius = 10
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
        
    private let liteLabel: UILabel = {
        let label = UILabel()
        label.tintColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "195 р."
        return label
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        backgroundColor = .none
        layer.cornerRadius = 12
        layer.borderColor = #colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1)
        layer.borderWidth = 2
        addSubview(drinkImage)
        addSubview(titleLabel)
        addSubview(liteImage)
        addSubview(liteLabel)
    }
    
    func fill(text: String) {
        titleLabel.text = text
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            drinkImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            drinkImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            drinkImage.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            drinkImage.heightAnchor.constraint(equalToConstant: frame.height / 2),
            
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            titleLabel.topAnchor.constraint(equalTo: drinkImage.bottomAnchor, constant: 10),
            
            liteImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 30),
            liteImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            liteImage.heightAnchor.constraint(equalToConstant: 30),
            liteImage.widthAnchor.constraint(equalToConstant: 30),
            
            liteLabel.leftAnchor.constraint(equalTo: liteImage.rightAnchor, constant: 10),
            liteLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25)
            
        ])
    }
    
}
