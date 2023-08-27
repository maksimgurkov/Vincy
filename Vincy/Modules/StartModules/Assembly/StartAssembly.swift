//
//  StartAssembly.swift
//  Vincy
//
//  Created by Максим Гурков on 27.08.2023.
//

import UIKit

final class StartAssembly {
    static func assemble() -> UIViewController {
        
        let buttonManager = StartButtonManager()
        let presenter = StartPresenter(startButtonManager: buttonManager)
        let view = StartViewController(presenter: presenter)
        
        presenter.view = view
        buttonManager.setupButton(button: view.startButton)
        return view
    }
}
