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
        collectionView.frame = view.frame(forAlignmentRect: CGRect(x: 0, y: 0, width: view.frame.width - 1, height: view.frame.height))

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionLayout.minimumLineSpacing = 8
        collectionLayout.scrollDirection = .vertical
        collectionView.reloadData()
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            
        ])
    }
}

extension DrinksViewController: DrinksViewInputProtocol {
    
}
