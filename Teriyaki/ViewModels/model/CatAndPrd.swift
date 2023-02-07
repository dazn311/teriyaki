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

//MARK: for POST add to cart;

struct PrdFetchQuery: Codable {
    let keyQuery: String //productID
    let valQuery: String //quantity
}

struct AddToCartRequest: Codable {
    let success: String //productID
    let res: String //quantity
}
//{
//    "success": "Success: You have modified your shopping cart!",
//    "res": "ok"
//}


struct CartPrd: Codable, Identifiable {
    let id: String
    let productID: String
    let name, model, quantity, price, total: String
    
    enum CodingKeys: String, CodingKey {
        case id = "cart_id"
        case productID = "product_id"
        case name, model, quantity, price, total
    }
}

struct CartTotal: Codable {
    let title, text: String
}

struct CartFetch: Codable {
    let products: [CartPrd]
    let totals: [CartTotal]
}

//{
//    "products": [
//        {
//            "cart_id": "4302",
//            "product_id": "57",
//            "name": "Роллы классика лосось спайси",
//            "model": "Роллы",
//            "option": [],
//            "quantity": "2",
//            "stock": true,
//            "shipping": "1",
//            "price": "360P",
//            "total": "720P",
//            "reward": 0
//        }
//    ],
//    "totals": [
//        {
//            "title": "Сумма",
//            "text": "720P"
//        },
//        {
//            "title": "Итого",
//            "text": "720P"
//        }
//    ]
//}
