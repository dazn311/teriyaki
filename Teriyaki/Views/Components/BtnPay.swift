import SwiftUI
import CoreData

struct BtnPay: View {
    @Environment(\.managedObjectContext) var moc
    var prd: ProductFromCatalog = MockeData.productFromCatalog11

    var body: some View {
        HStack {
            Button {
                    addPrd(prd: prd)
            } label: {
                Text("\(prd.price)")
                    .badge(3)
                    .foregroundColor(ThemeApp.gold) // If you have this
                    .frame(maxHeight: 30)
                    .padding(.horizontal,16)
                    .padding(.vertical, 2)
//                    .background(Capsule(style: .circular).stroke(Color.gray, lineWidth: 1.0))
//                    .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1.0))
                    .clipped()
                
                    .overlay(RoundedRectangle(cornerRadius: 4).stroke(ThemeApp.gold, lineWidth: 1))
            }
            .cornerRadius(4)         // You also need th
            .overlay(alignment: .topTrailing) {
                Text("3")
                    .fixedSize(horizontal: true, vertical: false)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Color.white)
                    .padding(.horizontal, 6)
                    .padding(.vertical, 2)
                    .background(
                        Capsule()
                            .fill(Color.red)
                            .aspectRatio(1, contentMode: .fill)
                    )
                    .offset(x: 5, y: -10)
            }
            
            Spacer()
        }
        .frame(minHeight: 50, maxHeight: 50, alignment: .leading)
        .padding(.horizontal,10)
        .padding(.bottom,4)
    }
    
    func addPrd(prd: ProductFromCatalog ) {
        if (isExist(productID: prd.id)) {
            print("prd already have")
        }else {
            let SoGalBi = Product(context: moc)
            SoGalBi.description2 = prd.description
            SoGalBi.href = prd.href
            SoGalBi.jan = prd.jan
            SoGalBi.name = prd.name
            SoGalBi.parentID = "70"
            SoGalBi.price = prd.price
            SoGalBi.minimum = "0"
            SoGalBi.model = "ss"
            SoGalBi.productID = prd.id
            SoGalBi.rating = Int16(prd.rating)
            SoGalBi.special = false
            SoGalBi.tax = "0"
            SoGalBi.thumb = prd.thumb
            do {
                try moc.save()
                print("moc save: prd.price-\(prd.price)")
            } catch {
                let nsError = error as NSError
                print("error2: \(nsError)")
            }
        }
        
    }
    
    func isExist(productID: String) -> Bool {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Product")
        fetchRequest.predicate = NSPredicate(format: "productID = %d", argumentArray: [productID])

        let res = try! moc.fetch(fetchRequest)
        return res.count > 0 ? true : false
    }
}

struct BtnPay_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BtnPay()
            BtnPay()
                .preferredColorScheme(.dark)
        }
    }
}

