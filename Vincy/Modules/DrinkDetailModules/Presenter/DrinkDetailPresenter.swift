
import Foundation

final class DrinkDetailPresenter {
    
    weak var view: DrinkDetailViewInput?
    
    private var viewModel: ProductViewModel!
    
    init(viewModel: ProductViewModel!) {
        self.viewModel = viewModel
    }
    
}

extension DrinkDetailPresenter: DrinksPresenterProtocol {
    func viewDidLoad() {
        DispatchQueue.main.async {
            self.view?.updateDetailInformationDrink(viewModel: self.viewModel)
        }
    }
    
    
}
