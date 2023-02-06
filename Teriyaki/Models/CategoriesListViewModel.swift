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
//    @Published var searchTerm: String = ""
    @Published var data: [Category] = []
    @Published var state: StatusFetch = .initional

    var categoryID = "70"
    var subscriptions = Set<AnyCancellable>()
    
//    func addToCore () {
//        let item = CatLevelEntity(context: PersistenceController.shared.container.viewContext)
//        data.append(item)
//    }
    
    func fetchCats(for searchTerm: String, version: Int = 0, completion: @escaping(Int) -> Void) {
        guard data.count == 0 else {
            return
        }

        state = .fetching
        
        service.fetchCatalogTop(searchTerm: searchTerm) { [weak self]  result in
            DispatchQueue.main.async {
                switch result {
                    case .success(let results):
                        self?.state = .fetched
//                        let serverVer = results.version
                        if (results.version > version) {
//                            var carArr: [CatLevelEntity] = []
//                            results.cats.forEach { cat in
//                                let catEn = CatLevelEntity()
//                                catEn.categoryID = cat.categoryID
//                                catEn.name = cat.name
//                                catEn.sortOrder = cat.sortOrder
//                                carArr.append(catEn)
//                            }
//                            let resFetch = (Array(results.cats) as? [CatLevelEntity]) ?? []
                            self?.data = results.cats
                            if (results.cats.count > 0) {
                                self?.categoryID = results.cats[0].categoryID
                            }
                            completion(results.version)
                        }
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
