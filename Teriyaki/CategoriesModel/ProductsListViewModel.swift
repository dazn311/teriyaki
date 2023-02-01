//
//  ProductsListViewModel.swift
//  Teriyaki
//
//  Created by dazn311 on 31.01.2023.
//

import Foundation
import Combine

class ProductsListViewModel: ObservableObject {
    private let service = APIService()

    @Published var searchTerm: String = ""
    @Published var dataArr: PrdAndCatData = PrdAndCatData()
    @Published var parentId: String = "70"
    
    @Published var state: StatusFetch = .initional

    private var subscriptions = Set<AnyCancellable>()

    init() {
        $parentId
            .sink { [weak self] parId in
                self?.state = .fetching
                self?.fetchPrds(for: parId)
        }.store(in: &subscriptions)
    }
    
    func fetchPrds(for searchTerm: String) {
        service.fetchPrd(searchTerm: searchTerm) { [weak self]  result in
            DispatchQueue.main.async {
                switch result {
                    case .success(let results):
                        self?.dataArr[results.activecat] = results.categories
                        self?.state = .fetched
                    case .failure(let error):
                        self?.state = .error(error.localizedDescription)
                }
            }
        }
    }
}
