
import UIKit

protocol DrinksRouterProtocol {
    func routerDetail(viewModel: ProductViewModel)
}

final class DrinksRouter: DrinksRouterProtocol {
    
    weak var view: UIViewController?
    
    func routerDetail(viewModel: ProductViewModel) {
        let detail = DrinkDetailAssembly.assemble(viewModel: viewModel)
        view?.present(detail, animated: true)
    }
}
