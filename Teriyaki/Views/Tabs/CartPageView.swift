import SwiftUI

struct CartPageView: View {
    @EnvironmentObject var cartVM : CartViewModel
    
    var body: some View {
        VStack {
            Text("Корзина")
            List(cartVM.data, id: \.id) { cart in
                Text("\(cart.name)")
            }
            if cartVM.totals.count > 0 {
                Text("\(cartVM.data.count) товаров на сумму: \(cartVM.totals[0].text)")
            }
        }
    }
    
//    init(filter: String) {
//        _fetchRequestPrd = FetchRequest<Product>(sortDescriptors: [], predicate: nil)
//    }
}

//struct CartPageView_Previews: PreviewProvider {
//    static var previews: some View {
//        CartPageView(fetchRequestPrd: FetchedResults<Product>())
//
//    }
//}
