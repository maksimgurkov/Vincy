import UIKit

final class CouponViewController: UIViewController {
    // MARK: - Properties
    
    private let presenter: CouponPresenterProtocol
    private lazy var paperBagImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Coupon_coffee")
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.contentMode = .scaleAspectFill
        return view
    }()
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.backgroundColor = #colorLiteral(red: 1, green: 0.9607843137, blue: 0.9137254902, alpha: 1)
        return view
    }()
    private lazy var codeBackgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.backgroundColor = #colorLiteral(red: 1, green: 0.9607843137, blue: 0.9137254902, alpha: 1)
        return view
    }()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .headline1
        label.textAlignment = .left
        label.textColor = #colorLiteral(red: 0.137254902, green: 0.04705882353, blue: 0.007843137255, alpha: 1)
        label.text = "Скидка 25%"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var couponLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Купон"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var codeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .headline4
        label.text = "КОФЕ МНОГО НЕ БЫВАЕТ"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var perforationViews: [UIView] = {
        var views: [UIView] = []
        for _ in 0..<30 {
            let view = UIView()
            view.layer.cornerRadius = 2
            view.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.862745098, blue: 0.7764705882, alpha: 1)
            views.append(view)
        }
        return views
    }()
    
    init(presenter: CouponPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.862745098, blue: 0.7764705882, alpha: 1)
        title = NSLocalizedString("tabBarCouponTitle", comment: "")
        presenter.viewDidLoad()
        viewsAdding()
        setConstraint()
    }
}

extension CouponViewController: CouponViewInputProtocol {}

private extension CouponViewController {
    private func viewsAdding() {
        let views = [backgroundView, codeBackgroundView] + perforationViews
        views.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(view)
        }
        backgroundView.addSubview(titleLabel)
        codeBackgroundView.addSubview(codeLabel)
        backgroundView.addSubview(paperBagImageView)
    }
    
    func setConstraint() {
        NSLayoutConstraint.activate([
            backgroundView.heightAnchor.constraint(equalTo: backgroundView.widthAnchor, multiplier: 1),
            backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            backgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            
            codeBackgroundView.heightAnchor.constraint(equalToConstant: 80),
            codeBackgroundView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            codeBackgroundView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            codeBackgroundView.topAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 0),
            
            titleLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 20),
            titleLabel.leftAnchor.constraint(equalTo: backgroundView.leftAnchor,constant: 20),
            titleLabel.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -20),
            
            paperBagImageView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            paperBagImageView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor, constant: 50),
            paperBagImageView.heightAnchor.constraint(equalTo: backgroundView.heightAnchor, multiplier: 0.8),
            paperBagImageView.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, multiplier: 0.8),
            
            codeLabel.centerXAnchor.constraint(equalTo: codeBackgroundView.centerXAnchor),
            codeLabel.centerYAnchor.constraint(equalTo: codeBackgroundView.centerYAnchor),
        ])
        
        for (index, perforationView) in perforationViews.enumerated() {
            NSLayoutConstraint.activate([
                perforationView.widthAnchor.constraint(equalToConstant: 12),
                perforationView.heightAnchor.constraint(equalToConstant: 4),
                perforationView.topAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -2),
                perforationView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: CGFloat(20 * index + 20))
            ])
        }
    }
}
