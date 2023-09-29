//
//  Product.swift
//  ProductAPI
//
//  Created by Manish Parihar on 27.09.23.
//

import Foundation

// MARK: - Product
struct Product: Codable {
    let products: [ProductElement]
    let total, skip, limit: Int?
}

// MARK: - ProductElement
struct ProductElement: Identifiable, Codable {
    let id:Int
    let title:String?
    let description:String?
    let price:Int?
    let discountedPercentage: Double?
    let rating:Double?
    let stock:Int?
    let brand:String?
    let category:String?
    let thumbnail:String?
    let images:[String]?
}
