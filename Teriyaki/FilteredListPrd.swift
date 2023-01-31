//
//  FilteredListPrd.swift
//  Teriyaki
//
//  Created by dazn311 on 27.01.2023.
//
import CoreData
import SwiftUI

struct FilteredListPrd<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>
    let content: (T) -> Content
    
    var body: some View {
        VStack {
            Text("FilterdList")
            List(fetchRequest, id: \.self) { item in
                    self.content(item)
            }
        }
    }
    
    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        _fetchRequest = FetchRequest<T>(sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue))
        self.content = content
    }
}

//struct FilteredListPrd_Previews: PreviewProvider {
//    static var previews: some View {
//        FilteredListPrd(FetchRequestPrd: Product)
//    }
//}

//struct FilteredListPrd: View {
//    @FetchRequest var fetchRequestPrd: FetchedResults<Product>
//
//    var body: some View {
//        VStack {
//            Text("FilterdList")
//            List(fetchRequestPrd, id: \.self) { product in
//
//                if let value = product.wrappedDescription {
//                    Text("\(product.name!) - \(value) - \(product.wrappedDescriptionKg)")
//                }
//
//            }
//        }
//    }
//
//    init(filter: String) {
//        _fetchRequestPrd = FetchRequest<Product>(sortDescriptors: [],
//                                                 predicate: NSPredicate(format: "parentID BEGINSWITH %@", filter))
//
//    }
//}
