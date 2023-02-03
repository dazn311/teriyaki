//
//  SetupApp.swift
//  Teriyaki
//
//  Created by dazn311 on 27.01.2023.
//

import Foundation

struct SetupApp {
    static let urlProducts = "https://teriyaki.su/index.php?route=api/product/short"
    static let urlCatalog = "https://teriyaki.su/index.php?route=api/zstore3/cats"
    
    static let urlCatalogShort = "https://teriyaki.su/index.php?route=api/zstore3/catstoplevel"
    static let urlPrdOfCatId = "https://teriyaki.su/index.php?route=api/category&path="
    static let retrieveToken = "daaM3rR6duNcLxlNq2hepHjBifYIwS2NBGGY3bOh15X5X4515LRl11bGBClMRBxgvHrTyYiYTUpJKevibyXyVoEGlsaY5BL5LohJxuONoNSrLkaRegQAhz2Ob3BmQGUrwpJMbqhObeq8vTVUX7spnn6AHTTMf1gO7xC8Ut7mmA5cR2JorjRW0Jq8raZtBmgc7EC3RTzhrYxpIR52fMhSnRZFjXO4M6qxvzWRZmWqovBHC7taITFS1mHXzXv3ug2x"
    
    //add to cart product
    //post https://teriyaki.su/index.php?route=api/cart/add
    //params: product_id = 57, (option) quantity=2
    static let urlAddToCartPrd = "https://teriyaki.su/index.php?route=api/cart/add"
    
    
}

struct UrlCart {
    let add: AddToCart
}

struct AddToCart {
    let route: String
    let productID: String
    let quantity: String
    
    static let route = "api/cart/add"
    static let productID = ""
    static let quantity = "2"
}

let newValue = UrlCart.init(add: AddToCart(route: "api/cart/add", productID: "57", quantity: "2"))


//{urlCatalogShort = "/index.php?route=api/zstore3/catstoplevel"
//    "cats": [
//        {
//            "name": "Корейская",
//            "sort_order": "0",
//            "category_id": "70"
//        },
//        {
//            "name": "Японская",
//            "sort_order": "2",
//            "category_id": "67"
//        },
//        {
//            "name": "Китайская",
//            "sort_order": "3",
//            "category_id": "77"
//        }
//    ],
//    "ver": 4,
//    "res": "ok"
//}


///{/index.php?route=api/category&path="
//  "activecat": "70",
//  "version": "1",
//  "categories": [
//    {
//        "name": "Горячие на 2(3) персоны",
//        "thumb": "https://teriyaki.su/image/cache/catalog/Korean/Hot%202%20person/sechuanski-0x0.jpg",
//        "parent_id": "70",
//        "category_id": "76",
//        "sort_order": "2",
//        "products": [
//            {
//                "product_id": "117",
//                "thumb": "https://teriyaki.su/image/cache/catalog/Korean/Hot%202%20person/Kimchi-tim-300x200.jpg",
//                "name": "Дэчжи кимчи тим",
//                "description": "капуста кимчи, свинина, картофель.1500гр..",
//                "price": "2900.0000",
//                "jan": "spicy",
//                "sort_order": "1",
//                "viewed": "356",
//                "category_id": "76",
//                "rating": 0,
//                "href": "http://teriyaki.su/index.php?route=product/product&path=70_76&product_id=117"
//            },
