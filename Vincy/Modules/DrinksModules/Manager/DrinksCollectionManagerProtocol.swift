
import UIKit

protocol DrinksCollectionManagerProtocol {
    func setupCollection(collectionView: UICollectionView)
    func updateCollection(viewModels: [ProductViewModel])
}
