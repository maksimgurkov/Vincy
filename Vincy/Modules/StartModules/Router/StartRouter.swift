//
//  StartRouter.swift
//  Vincy
//
//  Created by Максим Гурков on 27.08.2023.
//

import UIKit

protocol StartRouter {
    func presentTabBarController(viewController: UIViewController)
}

extension Router: StartRouter {
    func presentTabBarController(viewController: UIViewController) {
        let tabBarVC = TabBarAssembly.assemble()
        viewController.present(tabBarVC, animated: true)
    }
    
    
}
