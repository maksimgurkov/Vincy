//
//  TabBarAssembly.swift
//  Vincy
//
//  Created by Максим Гурков on 27.08.2023.
//

import UIKit

final class TabBarAssembly {
    
    static func assemble() -> UITabBarController {
        
        let tabBarManager = TabBarManager()
        let presenter = TabBarPresenter(tabBar: tabBarManager)
        let view = TabBarViewController(presenter: presenter)
        
        presenter.view = view
        tabBarManager.setupTabBar(tabBar: view.myTabBar)
        
        return view
    }
}
