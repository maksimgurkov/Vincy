//
//  DrinksPresenter.swift
//  Vincy
//
//  Created by Максим Гурков on 28.08.2023.
//

import Foundation

final class DrinksPresenter {
    
    weak var view: DrinksViewInputProtocol?
    
    private let router: DrinksRouterProtocol
    private let networkService: NetworkServiceProtocol
    private let collectionViewManager: DrinksCollectionManagerProtocol
    
    init(router: DrinksRouterProtocol, networkService: NetworkServiceProtocol, collectionViewManager: DrinksCollectionManagerProtocol) {
        self.collectionViewManager = collectionViewManager
        self.networkService = networkService
        self.router = router
    }
    
}

extension DrinksPresenter: DrinksPresenterProtocol {
    func viewDidLoad() {
        networkService.fetchData { [weak self] result in
            self?.createViewModels(models: result)
        }
    }
    
    
}

private extension DrinksPresenter {
    func createViewModels(models: [ProductModel]) {
        
        var viewModels = [ProductViewModel]()
        
        models.forEach({
            let viewModel = ProductViewModel(title: $0.nameProduct, image: $0.imageProduct, price: $0.priceProduct) { [weak self] model in
                self?.router.routerDetail(viewModel: model)
            }
            viewModels.append(viewModel)
        })
        DispatchQueue.main.async {
            self.collectionViewManager.updateCollection(viewModels: viewModels)
        }
    }
}
