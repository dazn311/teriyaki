//
//  MockeData.swift
//  Teriyaki
//
//  Created by dazn311 on 25.01.2023.
//

import Foundation


let prevDataCategories: [Category2] = [
    .init(level: "0", pathID: "77", sortOrder: "3", statuss: "1", parentID: "0", categoryID: "77", name: "Китайская кухня"),
    .init(level: "0", pathID: "67", sortOrder: "3", statuss: "1", parentID: "0", categoryID: "67", name: "Китайская кухня"),
    .init(level: "0", pathID: "77", sortOrder: "3", statuss: "1", parentID: "77", categoryID: "78", name: "Китайская кухня-Горячие блюда"),
    .init(level: "0", pathID: "70", sortOrder: "0", statuss: "1", parentID: "0", categoryID: "70", name: "Корейская кухня"),
    .init(level: "0", pathID: "73", sortOrder: "6", statuss: "1", parentID: "70", categoryID: "73", name: "Корейская кухня-Горячие блюда"),
    .init(level: "0", pathID: "70", sortOrder: "8", statuss: "1", parentID: "70", categoryID: "94", name: "Корейская кухня-Десерты"),
]

class MockeData {
    public static let productFromCatalog11: ProductFromCatalog = ProductFromCatalog(id: "1", thumb: "https//teriyaki.su", name: "prdd", description: "dess", price: "10p", jan: "", sortOrder: "1", viewed: "1", categoryID: "70", rating: 2, href: "https//teriyaki.su")
}

//let catArr = [
//    {
//        "level": "0",
//        "path_id": "70",
//        "sort_order": "7",
//        "statuss": "1",
//        "parent_id": "70",
//        "category_id": "93",
//        "name": "Корейская кухня-Закуски"
//    },
//    {
//        "level": "0",
//        "path_id": "70",
//        "sort_order": "4",
//        "statuss": "1",
//        "parent_id": "70",
//        "category_id": "74",
//        "name": "Корейская кухня-Лапша и Рис"
//    },
//    {
//        "level": "0",
//        "path_id": "70",
//        "sort_order": "400",
//        "statuss": "1",
//        "parent_id": "70",
//        "category_id": "98",
//        "name": "Корейская кухня-Напитки"
//    },
//    {
//        "level": "0",
//        "path_id": "70",
//        "sort_order": "17",
//        "statuss": "1",
//        "parent_id": "70",
//        "category_id": "82",
//        "name": "Корейская кухня-Супы"
//    },

//    {
//        "level": "0",
//        "path_id": "67",
//        "sort_order": "9",
//        "statuss": "1",
//        "parent_id": "67",
//        "category_id": "91",
//        "name": "Японская кухня-Горячие блюда"
//    },
//    {
//        "level": "0",
//        "path_id": "67",
//        "sort_order": "8",
//        "statuss": "1",
//        "parent_id": "67",
//        "category_id": "90",
//        "name": "Японская кухня-Горячие закуски"
//    },
//    {
//        "level": "0",
//        "path_id": "67",
//        "sort_order": "4",
//        "statuss": "1",
//        "parent_id": "67",
//        "category_id": "83",
//        "name": "Японская кухня-Гунканы"
//    },
//    {
//        "level": "0",
//        "path_id": "67",
//        "sort_order": "4",
//        "statuss": "1",
//        "parent_id": "67",
//        "category_id": "97",
//        "name": "Японская кухня-Гунканы спайси"
//    },
//    {
//        "level": "0",
//        "path_id": "67",
//        "sort_order": "10",
//        "statuss": "1",
//        "parent_id": "67",
//        "category_id": "96",
//        "name": "Японская кухня-ПОКЕ/жаренный рис"
//    },
//    {
//        "level": "0",
//        "path_id": "67",
//        "sort_order": "1",
//        "statuss": "1",
//        "parent_id": "67",
//        "category_id": "72",
//        "name": "Японская кухня-Роллы "
//    },
//    {
//        "level": "2",
//        "path_id": "61",
//        "sort_order": "6",
//        "statuss": "1",
//        "parent_id": "72",
//        "category_id": "61",
//        "name": "Японская кухня-Роллы -Роллы 6 шт"
//    },
//    {
//        "level": "0",
//        "path_id": "67",
//        "sort_order": "6",
//        "statuss": "1",
//        "parent_id": "72",
//        "category_id": "84",
//        "name": "Японская кухня-Роллы -Роллы 8 шт"
//    },
//    {
//        "level": "0",
//        "path_id": "67",
//        "sort_order": "5",
//        "statuss": "1",
//        "parent_id": "67",
//        "category_id": "87",
//        "name": "Японская кухня-Салаты"
//    },
//    {
//        "level": "1",
//        "path_id": "60",
//        "sort_order": "3",
//        "statuss": "1",
//        "parent_id": "67",
//        "category_id": "60",
//        "name": "Японская кухня-Сашими"
//    },
//    {
//        "level": "0",
//        "path_id": "67",
//        "sort_order": "8",
//        "statuss": "1",
//        "parent_id": "67",
//        "category_id": "89",
//        "name": "Японская кухня-Супы"
//    },
//    {
//        "level": "1",
//        "path_id": "59",
//        "sort_order": "2",
//        "statuss": "1",
//        "parent_id": "67",
//        "category_id": "59",
//        "name": "Японская кухня-Суши"
//    },
//    {
//        "level": "0",
//        "path_id": "67",
//        "sort_order": "20",
//        "statuss": "1",
//        "parent_id": "67",
//        "category_id": "92",
//        "name": "Японская кухня-Удон/WOK"
//    },
//    {
//        "level": "0",
//        "path_id": "67",
//        "sort_order": "6",
//        "statuss": "1",
//        "parent_id": "67",
//        "category_id": "88",
//        "name": "Японская кухня-Холодные закуски"
//    }
//]

