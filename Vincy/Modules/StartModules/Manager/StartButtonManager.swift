
import UIKit

final class StartButtonManager: UIButton {
    
    weak var startButton: UIButton?
}

extension StartButtonManager: StartButtonManagerProtocol {
    func setupButton(button: UIButton) {
        startButton = button
        startButton?.setTitle(NSLocalizedString("startViewButton", comment: ""), for: .normal)
        startButton?.backgroundColor = .brown
        startButton?.layer.cornerRadius = 12
        startButton?.translatesAutoresizingMaskIntoConstraints = false
    }
}
