
import UIKit

final class DrinkDetailViewController: UIViewController {
    
    private let presenter: DrinkDetailPresenter
    
    private let nameDrinkLabel: UILabel = {
        return UILabel()
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
        view.addSubview(nameDrinkLabel)
        setConstraints()
        presenter.viewDidLoad()
    }
    
}

extension DrinkDetailViewController: DrinkDetailViewInput {
    func updateDetailInformationDrink(viewModel: ProductViewModel) {
        self.nameDrinkLabel.text = viewModel.title
    }
}

private extension DrinkDetailViewController {
    func setConstraints() {
        
        nameDrinkLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameDrinkLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            nameDrinkLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            nameDrinkLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
            
        ])
    }
}
