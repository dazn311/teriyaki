import SwiftUI
import CoreData

struct BtnPay: View {
    @Environment(\.managedObjectContext) var moc
    @EnvironmentObject var cartVM : CartViewModel
    @State var badgeCount: String = "0"
    
    var prd: ProductFromCatalog = MockeData.productFromCatalog11
    var catID: String = ""
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
                    .clipped()
                
                    .overlay(RoundedRectangle(cornerRadius: 4).stroke(ThemeApp.gold, lineWidth: 1))
            }
            .cornerRadius(4)         // You also need th
            .overlay(alignment: .topTrailing) {
                if badgeCount != "0" {
                    Text(badgeCount)
                        .fixedSize(horizontal: true, vertical: false)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(Color.white)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(
                            Capsule()
                                .fill(Color.red.opacity(0.7))
                                .aspectRatio(1, contentMode: .fill)
                        )
                        .offset(x: 5, y: -10)
                }
            }
            
            Spacer()
        }
        .frame(minHeight: 50, maxHeight: 50, alignment: .leading)
        .padding(.horizontal,10)
        .padding(.bottom,4)
    }
    
    func addPrd(prd: ProductFromCatalog ) {
//        print("add: \(prd)")
        let service = APIService()
        let data = [PrdFetchQuery(keyQuery: "product_id", valQuery: prd.id),PrdFetchQuery(keyQuery: "quantity", valQuery: "1")]
        
        service.addToCart(data: data) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let results):
                    if results.res == "ok" {
                        self.badgeCount = "1"
                        cartVM.fetchCart()
                    }
                    
                case .failure(let error):
                    self.badgeCount = "0"
                    print(error.localizedDescription)
                }
            }
        }
    }
}
    
//add: ProductFromCatalog(id: "341", thumb: "https://teriyaki.su/image/cache/catalog/Korean/Hot%202%20person/modum-suuk-2-3-300x200.jpg", name: "Модум суюк", description: "Горячее блюдо из говяжьего языка ,говяжьих сухожилий,говяжий рульки,лук порей,чили перец,говяжий бул..", price: "3 600р", jan: "", sortOrder: "3", viewed: "6", categoryID: "76", rating: 0, href: "http://teriyaki.su/index.php?route=product/product&path=70_76&product_id=341")
//type fetch: AddToCartRequest
//The data couldn’t be read because it isn’t in the correct format.

struct BtnPay_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BtnPay()
            BtnPay()
                .preferredColorScheme(.dark)
        }
    }
}

