//
//  FavoritePageView.swift
//  Teriyaki
//
//  Created by dazn311 on 03.02.2023.
//

import SwiftUI

struct FavoritePageView: View {
    @FetchRequest var fetchRequestPrd: FetchedResults<Product>
    
    var body: some View {
        VStack {
            Text("Избранные")
            
            List(["Избранные"], id: \.self) { cat in
                Section(cat) {
                    ForEach(fetchRequestPrd, id: \.self) { prd in
                        Text("\(prd.wrappedName)")
                    }
                    .onDelete { IndexSet in
                        print("del")
                    }
                }
            }
        }
    }
    
    init(filter: String) {
        _fetchRequestPrd = FetchRequest<Product>(sortDescriptors: [], predicate: nil)
//        _fetchRequestPrd = FetchRequest<Product>(sortDescriptors: [], predicate: NSPredicate(format: "parentID BEGINSWITH %@", filter))

    }
}

//struct CartPageView_Previews: PreviewProvider {
//    static var previews: some View {
//        CartPageView(fetchRequestPrd: FetchedResults<Product>())
//
//    }
//}
