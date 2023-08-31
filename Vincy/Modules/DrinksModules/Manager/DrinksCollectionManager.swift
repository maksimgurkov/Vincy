
import UIKit

final class DrinksCollectionManager: NSObject {
    
    weak var collectionView: UICollectionView?
    
    private var viewModels = [ProductViewModel]()
}

extension DrinksCollectionManager: DrinksCollectionManagerProtocol {
    
    func updateCollection(viewModels: [ProductViewModel]) {
        self.viewModels = viewModels
        collectionView?.reloadData()
    }
    
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
        viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DrinksCollectionCell.id, for: indexPath) as? DrinksCollectionCell else { return UICollectionViewCell() }
        let viewModel = viewModels[indexPath.item]
        cell.fill(viewModel: viewModel)
        return cell
    }
    
    
}

extension DrinksCollectionManager: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let viewModel = viewModels[indexPath.item]

        viewModel.didTape(viewModel)
        print(indexPath.item)
    }
    
}

extension DrinksCollectionManager: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 2.3,
               height: 220)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
}

