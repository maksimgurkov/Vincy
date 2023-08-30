//
//  DrinksCollectionManager.swift
//  Vincy
//
//  Created by Максим Гурков on 28.08.2023.
//

import UIKit

final class DrinksCollectionManager: NSObject {
    
    weak var collectionView: UICollectionView?
    private let collectionParameters = CollectionLayoutParameters(
        cellCount: 2,
        leftInset: 20,
        rightInset: 20,
        cellSpacing: 7
    )
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
        cell.fill(text: "Капучино")
        return cell
    }
    
    
}

extension DrinksCollectionManager: UICollectionViewDelegate {
    
}

extension DrinksCollectionManager: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 2.1,
               height: 200)
//        let availableWidth = collectionView.frame.size.width - collectionParameters.paddingWidth
//        let cellWidth = availableWidth / CGFloat(collectionParameters.cellCount)
//        return CGSize(width: cellWidth, height: 100)
    }
}
