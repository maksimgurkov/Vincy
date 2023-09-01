//

import UIKit

final class DrinksViewController: UIViewController {
    
    private let presenter: DrinksPresenterProtocol
    
    private let collectionLayout = UICollectionViewFlowLayout()
    
    lazy var collectionView: UICollectionView = {
        return UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
    }()
    
    init(presenter: DrinksPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = NSLocalizedString("tabBarDrinksTitle", comment: "")
        tabBarController?.tabBar.tintColor = .brown
        view.addSubview(collectionView)
        presenter.viewDidLoad()
        collectionView.frame = view.bounds

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionLayout.minimumLineSpacing = 20
        collectionLayout.scrollDirection = .vertical
    }
}

extension DrinksViewController: DrinksViewInputProtocol {
    
}
