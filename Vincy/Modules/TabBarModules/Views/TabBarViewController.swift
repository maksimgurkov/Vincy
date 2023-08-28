//
//  TabBarViewController.swift
//  Vincy
//
//  Created by Максим Гурков on 27.08.2023.
//

import UIKit

final class TabBarViewController: UITabBarController {
    
    private let presenter: TabBarPresenterProtocol
    
    lazy var myTabBar: UITabBar = {
        return UITabBar(frame: .zero)
    }()
    
    init(presenter: TabBarPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myTabBar)
        generatorTabBar()
        presenter.viewDidLoad()
    }
    
    // Генератор вью
    private func generator(viewController: UIViewController, title: String, image: String) -> UINavigationController {
        let item = UITabBarItem(title: title, image: UIImage(systemName: image), tag: 0)
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem = item
        navController.navigationBar.prefersLargeTitles = true
        return navController
    }
    
    // Генератор ТабБара
    private func generatorTabBar() {
        viewControllers = [
        generator(viewController: DrinksViewController(), title: NSLocalizedString("tabBarDrinksTitle", comment: ""), image: "cup.and.saucer"),
        generator(viewController: SnacksViewController(), title: NSLocalizedString("tabBarSnacksTitle", comment: ""), image: "popcorn"),
        generator(viewController: CuponViewController(), title: NSLocalizedString("tabBarCuponTitle", comment: ""), image: "percent"),
        generator(viewController: SettingViewController(), title: NSLocalizedString("tabBarSettingsTitle", comment: ""), image: "gearshape")
        ]
    }
    
}

extension TabBarViewController: TabBarViewInputProtocol { }
