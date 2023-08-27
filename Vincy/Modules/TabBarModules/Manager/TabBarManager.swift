//
//  TabBarManager.swift
//  Vincy
//
//  Created by Максим Гурков on 27.08.2023.
//

import UIKit

final class TabBarManager {
    
    weak var tabBar: UITabBar?
}

extension TabBarManager: TabBarManagerProtocol {
    func setupTabBar(tabBar: UITabBar) {
        self.tabBar = tabBar
    }
    
    
}
