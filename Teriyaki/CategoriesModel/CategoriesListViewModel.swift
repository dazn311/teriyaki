//
//  CategoriesListViewModel.swift
//  Teriyaki
//
//  Created by dazn311 on 31.01.2023.
//

import Foundation
import Combine

class CategoriesListViewModel: ObservableObject {
    private let service = APIService()
    
    @Published var searchTerm: String = ""
    @Published var data: [Category] = []
    
    @Published var state: StatusFetch = .initional

    var subscriptions = Set<AnyCancellable>()
    
    func fetchCats(for searchTerm: String) {
        guard data.count == 0 else {
            return
        }
        
        state = .fetching
        
        service.fetchCatalogTop(searchTerm: searchTerm) { [weak self]  result in
            DispatchQueue.main.async {
                switch result {
                    case .success(let results):
                        self?.data = results.cats
                        self?.state = .fetched
                    case .failure(let error):
                        print("58-error loading catalog: \(error)")
                        self?.state = .error(error.localizedDescription)
                }
            }
        }
    }
}

//    init() {
//        print("CategoriesListViewModel -- init ")
        
//        $parentId
//            .sink { [weak self] parId in
//                self?.state = .fetching
//                self?.fetchCats(for: "/catstoplevel")
//        }.store(in: &subscriptions)
//    }