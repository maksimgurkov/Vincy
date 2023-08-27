
import Foundation

final class StartPresenter {
    
    weak var view: StartViewInputProtocol?
    
    private let startButtonManager: StartButtonManagerProtocol
    
    init(startButtonManager: StartButtonManagerProtocol) {
        self.startButtonManager = startButtonManager
    }
    
}

extension StartPresenter: StartPresenterProtocol {
    func viewDidLoad() {
    }
}
