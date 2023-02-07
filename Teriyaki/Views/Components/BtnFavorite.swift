//
//  BtnFavorite.swift
//  Teriyaki
//
//  Created by dazn311 on 07.02.2023.
//

import CoreData
import SwiftUI

struct BtnFavorite: View {
    @Environment(\.managedObjectContext) var moc
    var prd: ProductFromCatalog = MockeData.productFromCatalog11
    var catID: String = ""
    var body: some View {
        Button {
            addToFavPrd(prd: prd)
        } label: {
            Image(systemName: "heart.circle")
                .foregroundColor(.red).padding(4)
        }
    }
    
    private func addToFavPrd(prd: ProductFromCatalog ) {
        if (isExist(productID: prd.id)) {
            print("prd already have")
        }else {
            let SoGalBi = Product(context: moc)
            SoGalBi.description2 = prd.description
            SoGalBi.href = prd.href
            SoGalBi.jan = prd.jan
            SoGalBi.name = prd.name
            SoGalBi.parentID = catID
            SoGalBi.price = prd.price
            SoGalBi.minimum = "0"
            SoGalBi.model = "fav"
            SoGalBi.productID = prd.id
            SoGalBi.rating = Int16(prd.rating)
            SoGalBi.special = false
            SoGalBi.tax = "0"
            SoGalBi.thumb = prd.thumb
            
            PersistenceController.shared.save()
        }
        
    }
    
    private func isExist(productID: String) -> Bool {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Product")
        fetchRequest.predicate = NSPredicate(format: "productID = %d", argumentArray: [productID])

        let res = try! moc.fetch(fetchRequest)
        return res.count > 0 ? true : false
    }
}

//struct BtnFavorite_Previews: PreviewProvider {
//    static var previews: some View {
//        BtnFavorite()
//    }
//}
