//
//  CategoriesFetch.swift
//  Teriyaki
//
//  Created by dazn311 on 31.01.2023.
//

import Foundation
import Combine

struct CategoriesFetch: Codable {
    let cats: [Category]
    let version: Int
    let res: String
}


struct Category: Codable {
    let name, sortOrder, categoryID : String

    enum CodingKeys: String, CodingKey {
        case name
        case sortOrder = "sort_order"
        case categoryID = "category_id"
        
    }
}


//    {
//        "cats": [
//            {
//                "name": "Корейская",
//                "sort_order": "0",
//                "category_id": "70"
//            },
//            {
//                "name": "Японская",
//                "sort_order": "2",
//                "category_id": "67"
//            },
//            {
//                "name": "Китайская",
//                "sort_order": "3",
//                "category_id": "77"
//            }
//        ]
//    }
