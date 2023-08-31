
import UIKit

final class DrinksAssembly {
    
    static func assemble() -> UIViewController {
        
        let networkService = NetworkService()
        let collectionManager = DrinksCollectionManager()
        let presenter = DrinksPresenter(networkService: networkService, collectionViewManager: collectionManager)
        let view = DrinksViewController(presenter: presenter)
        
        presenter.view = view
        collectionManager.setupCollection(collectionView: view.collectionView)
        
        return view
        
    }
    
}
