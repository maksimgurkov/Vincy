import UIKit

final class CouponAssembly {
    static func assemble() -> UIViewController {
        let presenter = CouponPresenter()
        let view = CouponViewController(presenter: presenter)
        presenter.view = view

        return view
    }
}
