//
//  CartViewModel.swift
//  Teriyaki
//
//  Created by dazn311 on 07.02.2023.
//

import Foundation

class CartViewModel: ObservableObject {
    private let service = APIService()
    @Published var data: [CartPrd] = []
    @Published var totals: [CartTotal] = []
    @Published var countPrd: Int = 0
    
    @Published var dicPrd: [String: String] = ["0": "0"]
    
    private var isAddToCart = ""
    
    @Published var state: StatusFetch = .initional
    @Published var stateMessage: String = "initional"
    
    func fetchCart() {
        state = .fetching
        
        service.fetchCartData() { [weak self]  result in
            DispatchQueue.main.async {
                switch result {
                case .success(let results):
                    self?.state = .fetched
                    if (results.products.count > 0) {
                        self?.data = results.products
                        
                        var newDic: [String: String] = ["0": "0"]
                        results.products.forEach { prd in
                            newDic[prd.productID] = prd.quantity
                        }
                        self?.dicPrd = newDic
                        self?.totals = results.totals
                    }
                    self?.countPrd = results.products.count
                    //                    print("results: \(results)")
                case .failure(let error):
                    print("58-error loading catalog: \(error)")
                    self?.state = .error(error.localizedDescription)
                }
            }
        }
    }
    
    
}

//                        print("results.products: \(results.products)")
//                        [Teriyaki.CartPrd(id: "4363", productID: "123", name: "Мэун  Дезикалби Тим", model: "Горячие на 2 персоны", quantity: "1", price: "2700P", total: "2700P")]



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


