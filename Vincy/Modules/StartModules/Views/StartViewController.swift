
import UIKit

final class StartViewController: UIViewController {
    
    private let presenter: StartPresenterProtocol
    private let router: StartRouter = Router.shared
    
    lazy var startButton: UIButton = {
        return UIButton(frame: .zero)
    }()
    
    init(presenter: StartPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(startButton)
        presenter.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        startButton.addTarget(self, action: #selector(actionStartButton), for: .touchUpInside)
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            startButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            startButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70),
            startButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    @objc private func actionStartButton() {
        router.presentTabBarController(viewController: self)
    }
    
}

// MARK: - StartViewInputProtocol
extension StartViewController: StartViewInputProtocol {
    
}
