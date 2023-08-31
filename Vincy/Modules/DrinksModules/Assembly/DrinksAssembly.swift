
import UIKit

final class DrinksAssembly {
    
    static func assemble() -> UIViewController {
        
        let networkService = NetworkService()
        let collectionManager = DrinksCollectionManager()
        let router = DrinksRouter()
        let presenter = DrinksPresenter(router: router, networkService: networkService, collectionViewManager: collectionManager)
        let view = DrinksViewController(presenter: presenter)
        
        presenter.view = view
        router.view = view
        collectionManager.setupCollection(collectionView: view.collectionView)
        
        return view
        
    }
    
}
