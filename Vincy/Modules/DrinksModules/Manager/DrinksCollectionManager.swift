//
//  DrinksCollectionManager.swift
//  Vincy
//
//  Created by Максим Гурков on 28.08.2023.
//

import UIKit

final class DrinksCollectionManager: NSObject {
    
    weak var collectionView: UICollectionView?
}

extension DrinksCollectionManager: DrinksCollectionManagerProtocol {
    func setupCollection(collectionView: UICollectionView) {
        self.collectionView = collectionView
        self.collectionView?.register(DrinksCollectionCell.self, forCellWithReuseIdentifier: DrinksCollectionCell.id)
        self.collectionView?.backgroundColor = .none
        self.collectionView?.showsVerticalScrollIndicator = false
        setDelegate()
    }
    
    private func setDelegate() {
        collectionView?.delegate = self
        collectionView?.dataSource = self
    }
    
    
}

extension DrinksCollectionManager: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DrinksCollectionCell.id, for: indexPath) as? DrinksCollectionCell else { return UICollectionViewCell() }
        cell.fill(text: "jnjjnjjd")
        return cell
    }
    
    
}

extension DrinksCollectionManager: UICollectionViewDelegate {
    
}

extension DrinksCollectionManager: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 3.2,
               height: 200)
    }
}
