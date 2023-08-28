
import UIKit

final class DrinksAssembly {
    
    static func assemble() -> UIViewController {
        
        let collectionManager = DrinksCollectionManager()
        let presenter = DrinksPresenter(collectionViewManager: collectionManager)
        let view = DrinksViewController(presenter: presenter)
        
        presenter.view = view
        collectionManager.setupCollection(collectionView: view.collectionView)
        
        return view
        
    }
    
}
