//
//  DrinksPresenter.swift
//  Vincy
//
//  Created by Максим Гурков on 28.08.2023.
//

import Foundation

final class DrinksPresenter {
    
    weak var view: DrinksViewInputProtocol?
    
    private let collectionViewManager: DrinksCollectionManagerProtocol
    
    init(collectionViewManager: DrinksCollectionManagerProtocol) {
        self.collectionViewManager = collectionViewManager
    }
    
}

extension DrinksPresenter: DrinksPresenterProtocol {
    func viewDidLoad() {
    }
    
    
}
