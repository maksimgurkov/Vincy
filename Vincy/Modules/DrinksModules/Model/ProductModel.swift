//
//  ProductModel.swift
//  Vincy
//
//  Created by Максим Гурков on 31.08.2023.
//

import Foundation

//typealias Menu = [ProductModel]

struct ProductModel: Codable {
    let nameProduct: String
    let imageProduct: String
    let descriptionProduct: String
    let priceProduct: String
    let countProduct: [Int]
}
