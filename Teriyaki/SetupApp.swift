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
