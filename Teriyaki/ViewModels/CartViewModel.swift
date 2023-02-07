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
    
    private var isAddToCart = ""
    
    @Published var state: StatusFetch = .initional
    @Published var stateMessage: String = "initional"
    
//    init() {
//        self.fetchCart()
//    }
    
    func fetchCart() {
//        guard data.count == 0 else {
//            return
//        }
        
        state = .fetching
        
        service.fetchCartData() { [weak self]  result in
            DispatchQueue.main.async {
                switch result {
                case .success(let results):
                    self?.state = .fetched
                    if (results.products.count > 0) {
                        self?.data = results.products
                        self?.totals = results.totals
                    }
//                    print("results: \(results)")
                case .failure(let error):
                    print("58-error loading catalog: \(error)")
                    self?.state = .error(error.localizedDescription)
                }
            }
        }
    }
    
    
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


