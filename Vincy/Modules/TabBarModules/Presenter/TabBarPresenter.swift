//
//  TabBarPresenter.swift
//  Vincy
//
//  Created by Максим Гурков on 27.08.2023.
//

import Foundation

final class TabBarPresenter {
    
    weak var view: TabBarViewInputProtocol?
    
    private let tabBar: TabBarManagerProtocol
    
    init(tabBar: TabBarManagerProtocol) {
        self.tabBar = tabBar
    }
    
}

extension TabBarPresenter: TabBarPresenterProtocol {
    func viewDidLoad() {
        
    }
    
    
}
