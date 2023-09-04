import UIKit

final class CouponViewController: UIViewController {
    // MARK: - Properties
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .headline2
//        label.textColor = .darkGray
        label.text = "Капучино"
        return label
    }()
    private let presenter: CouponPresenterProtocol
    private lazy var codeBackgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.backgroundColor = .gray.withAlphaComponent(0.15)
        return view
    }()
    private let infoButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "info.circle")
        button.setImage(image, for: .normal)
        button.tintColor = .white
        return button
    }()
    private lazy var couponeCodeLabel: UILabel = {
        let label = UILabel()
        label.font = .headline3
        label.textColor = .darkGray
        label.textAlignment = .center
        label.text = NSLocalizedString("couponCodeTitleLabel", comment: "")
        return label
    }()
    private lazy var codeLabel: UILabel = {
        let label = UILabel()
        label.font = .headline3
        label.textAlignment = .center
        label.text = "2164685"
        return label
    }()
    
    // MARK: - Life cycle
    
    init(presenter: CouponPresenterProtocol){
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = NSLocalizedString("tabBarCuponTitle", comment: "")
        presenter.viewDidLoad()
        viewsAdding()
        setConstraint()
    }
}

// MARK: - Extensions

extension CouponViewController: CouponViewInputProtocol { }

private extension CouponViewController {
    private func viewsAdding() {
        [codeBackgroundView, infoButton, titleLabel, couponeCodeLabel, codeLabel].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(view)
        }
    }
    
    func setConstraint() {
        NSLayoutConstraint.activate([
            
            codeBackgroundView.heightAnchor.constraint(equalToConstant: 120),
            codeBackgroundView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            codeBackgroundView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            codeBackgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
//            titleLabel.heightAnchor.constraint(equalToConstant: 25),
            
            infoButton.rightAnchor.constraint(equalTo: codeBackgroundView.rightAnchor, constant: -10),
            infoButton.topAnchor.constraint(equalTo: codeBackgroundView.topAnchor, constant: 10),
            
            couponeCodeLabel.centerYAnchor.constraint(equalTo: codeBackgroundView.centerYAnchor),
            couponeCodeLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            couponeCodeLabel.heightAnchor.constraint(equalToConstant: 25),
            
            codeLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            codeLabel.bottomAnchor.constraint(equalTo: codeBackgroundView.bottomAnchor, constant: -6),
            codeLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
}
