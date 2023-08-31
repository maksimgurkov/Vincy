//
//  ProductCellType.swift
//  Vincy
//
//  Created by Максим Гурков on 31.08.2023.
//

import Foundation

struct ProductViewModel {
    let title: String
    let image: String
    let price: String
    let didTape: (String) -> Void
}
