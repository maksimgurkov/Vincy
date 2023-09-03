
import UIKit

final class DrinkDetailViewController: UIViewController {
    
    private let presenter: DrinkDetailPresenter
    
    private let closeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.tintColor = .brown
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let nameDrinkLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let drinkImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "Капучино")
        image.translatesAutoresizingMaskIntoConstraints = false
       return image
    }()
    
    init(presenter: DrinkDetailPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        [drinkImage, nameDrinkLabel, closeButton].forEach { view in
            self.view.addSubview(view)
        }
        setConstraints()
        closeButton.addTarget(self, action: #selector(actionCloseButton), for: .touchUpInside)
        presenter.viewDidLoad()
    }
    
    @objc private func actionCloseButton() {
        dismiss(animated: true)
    }
}

extension DrinkDetailViewController: DrinkDetailViewInput {
    func updateDetailInformationDrink(viewModel: ProductViewModel) {
        self.nameDrinkLabel.text = viewModel.title
        self.drinkImage.image = UIImage(named: "\(viewModel.image)")
    }
}

private extension DrinkDetailViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            drinkImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            drinkImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            drinkImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            drinkImage.heightAnchor.constraint(equalToConstant: 300),
            
            nameDrinkLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            nameDrinkLabel.topAnchor.constraint(equalTo: drinkImage.bottomAnchor, constant: 20),
            nameDrinkLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            closeButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            closeButton.widthAnchor.constraint(equalToConstant: 40),
            closeButton.heightAnchor.constraint(equalToConstant: 40)
            
        ])
    }
}
