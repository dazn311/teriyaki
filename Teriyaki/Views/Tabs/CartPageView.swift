//
//  CartPageView.swift
//  Teriyaki
//
//  Created by dazn311 on 03.02.2023.
//

import SwiftUI

struct CartPageView: View {
    @FetchRequest var fetchRequestPrd: FetchedResults<Product>
    
    var body: some View {
        VStack {
            Text("CartPage")
            
            List(fetchRequestPrd, id: \.self) { prd in
                Text("\(prd.wrappedDescription)")
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
