//
//  ProductsListViewModel.swift
//  Teriyaki
//
//  Created by dazn311 on 31.01.2023.
//

import Foundation
import Combine
import CoreData

class ProductsListViewModel: ObservableObject {
    
    private let service = APIService()
    @Published var dataCoreArr: [Product] = []

    @Published var searchTerm: String = ""
    @Published var dataArr: PrdAndCatData = PrdAndCatData()
    @Published var parentId: String = "0"
    
    @Published var state: StatusFetch = .initional

    private var subscriptions = Set<AnyCancellable>()

    init() {
        $parentId
            .sink { [weak self] parId in
                if parId != "0" && ((self?.dataArr[parId]?.isEmpty) == nil) {
                  self?.state = .fetching
                  self?.fetchPrds(for: parId)
                }
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
    
    func loadQuestion(viewContext: NSManagedObjectContext) -> NSArray{
            let fetchRequest: NSFetchRequest<Product> = Product.fetchRequest()

            do {
                let array = try PersistenceController.shared.container.viewContext.fetch(fetchRequest) as NSArray
                guard array.count > 0 else { print("[EHY!] Non ci sono elementi da leggere "); return array }

                return array
            } catch let errore {
                print("error FetchRequest: \(errore)")
            }

            return []
    }
    
}
