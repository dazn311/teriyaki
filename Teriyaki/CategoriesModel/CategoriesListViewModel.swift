//
//  CategoriesListViewModel.swift
//  Teriyaki
//
//  Created by dazn311 on 31.01.2023.
//

import Foundation
import Combine

class CategoriesListViewModel: ObservableObject {
 
    
    @Published var searchTerm: String = ""
    @Published var categoriesArr: [Category] = []
    
    @Published var state: StatusFetch = .initional {
        didSet {
            print("state statusFetch2 change to: \(state)")
        }
    }
    
    @Published var parentId = "70"
    
    var subscriptions = Set<AnyCancellable>()
    
    private let service = APIService()
    
    init() {
        print("start init CategoriesListViewModel")
        
//        $parentId
//            .sink { [weak self] parId in
//                self?.state = .fetching
//                self?.fetchCats(for: "/catstoplevel")
//        }.store(in: &subscriptions)
    }
    
    
    func fetchCats(for searchTerm: String) {
        guard categoriesArr.count == 0 else {
            print("222")
            return
        }
        
        state = .fetching
        
        service.fetchCatalogTop(searchTerm: searchTerm) { [weak self]  result in
            DispatchQueue.main.async {
                switch result {
                    case .success(let results):
                        self?.categoriesArr = results.cats
                        self?.state = .fetched

                    print("fetched cats \(results.cats.count)")
                        
                    case .failure(let error):
                        print("58-error loading catalog: \(error)")
                        self?.state = .error(error.localizedDescription)
                }
            }
        }
    }
    
    
    
    
    
    
}
