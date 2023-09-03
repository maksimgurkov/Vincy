import Foundation

final class CouponPresenter {
    weak var view: CouponViewInputProtocol?
    
    init() { }
}

extension CouponPresenter: CouponPresenterProtocol {
    func viewDidLoad() {
    }
}
