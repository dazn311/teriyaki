//
//  CatAndPrd.swift
//  Teriyaki
//
//  Created by dazn311 on 30.01.2023.
//

import Foundation

// MARK: - Products
struct ProductFromCatalog: Codable, Identifiable {
    let id: String
    let thumb: String
    let name, description, price, jan, sortOrder, viewed, categoryID: String
    let rating: Int
    let href: String

    enum CodingKeys: String, CodingKey {
        case id = "product_id"
        case thumb, name, description, price, jan
        case sortOrder = "sort_order"
        case viewed
        case categoryID = "category_id"
        case rating, href
    }
}

struct CatAndPrd: Codable, Identifiable {
    let name, thumb: String
    let parentID: String
    let id: String
    let sortOrder: String
    let products: [ProductFromCatalog]
    
    enum CodingKeys: String, CodingKey {
        case name, thumb
        case parentID = "parent_id"
        case id = "category_id"
        case sortOrder = "sort_order"
        case products
    }
}

struct PrdAndCatFetch: Codable {
    let activecat, version: String
    let categories: [CatAndPrd]
}

//struct PrdAndCatData: Codable {
//    let activecat: String
//    let data: [PrdAndCatFetch]?
//}
typealias PrdAndCatData = [String: [CatAndPrd]]

//let prevPrdAndCatData: PrdAndCatData = ["70": [CatAndPrd(name: "sdf", thumb: "df", parentID: "70", id: "93", sortOrder: "1", products: [ProductFromCatalog(id: "23", thumb: "sdf", name: "ddd", description: "sss", price: "222", jan: "spicy", sortOrder: "3", viewed: "1", categoryID: "12", rating: 1, href: "23eddd")])],)]
