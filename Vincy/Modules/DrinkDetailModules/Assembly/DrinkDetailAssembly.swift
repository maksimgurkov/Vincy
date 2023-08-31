
import UIKit

final class DrinkDetailAssembly {
    static func assemble(viewModel: ProductViewModel) -> UIViewController {
        
        let presenter = DrinkDetailPresenter(viewModel: viewModel)
        let view = DrinkDetailViewController(presenter: presenter)
        presenter.view = view
        
        return view
    }
}
