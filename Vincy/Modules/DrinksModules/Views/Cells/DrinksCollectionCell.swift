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
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 10
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.tintColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .bodyRegular
        return label
    }()
    
    private let volumeLabel: UILabel = {
        let label = UILabel()
        label.tintColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = " от 250 мл."
        label.font = .caption2
        return label
    }()
            
    private let liteLabel: UILabel = {
        let label = UILabel()
        label.tintColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "195 р."
        label.font = .caption2
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
        [drinkImage, titleLabel, volumeLabel, liteLabel].forEach { view in
            addSubview(view)
        }
    }
    
    func fill(viewModel: ProductViewModel) {
        titleLabel.text = viewModel.title
        drinkImage.image = UIImage(named: "\(viewModel.image)")
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            drinkImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            drinkImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            drinkImage.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            drinkImage.heightAnchor.constraint(equalToConstant: frame.height / 1.5),
            
            titleLabel.leftAnchor.constraint(equalTo: drinkImage.leftAnchor),
            titleLabel.rightAnchor.constraint(equalTo: drinkImage.rightAnchor),
            titleLabel.topAnchor.constraint(equalTo: drinkImage.bottomAnchor, constant: 10),
                        
            liteLabel.rightAnchor.constraint(equalTo: drinkImage.rightAnchor),
            liteLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            
            volumeLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            volumeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5)
            
        ])
    }
    
}
