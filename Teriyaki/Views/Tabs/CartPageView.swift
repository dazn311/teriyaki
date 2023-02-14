import SwiftUI

struct CartPageView: View {
    @EnvironmentObject var cartVM : CartViewModel
    
    var body: some View {
        VStack {
            Text("Корзина")
            List(cartVM.data, id: \.id) { cart in
                HStack {
                    HStack(alignment: .top) {
                        if let image = Image(cart.productID) {
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 40)
                        }else {
                            ProgressView()
                                .frame(width: 60, height: 40)
                                .border(.blue, width: 1.0)
                        }
                    }
//                    .frame(width: 90, height: 60, alignment: .topLeading)
                    .background(Color.blue)
                    
                    VStack {
                        Text("\(cart.name)")
                            .foregroundColor(ThemeApp.gold)
                            .frame(maxWidth: .infinity, maxHeight: 42.5, alignment: .topLeading)
                        HStack {
                            Text("\(cart.quantity) шт.")
                            Spacer()
                            Text("\(cart.price)")
                        }
                        .foregroundColor(Color.gray)
                    }
                    .padding(.trailing, 4)
                }
                .listRowInsets(EdgeInsets())
//                .padding(.horizontal, 0)
            }
//            .padding(.horizontal, 0)
            if cartVM.totals.count > 0 {
                HStack {
                    Text("\(cartVM.data.count) \(transformName(n: cartVM.data.count)) на сумму: \(cartVM.totals[0].text)")
                }
                .padding()
            }
        }
        .padding(.horizontal, 0)
    }
    private func transformName(n: Int) -> String {
        var name = "товар"
        if (n < 5 && n > 1) {
            name = "товара"
        }
        if (n > 5) {
            name = "товаров"
        }
        
        return name
    }
    
//    init(filter: String) {
//        _fetchRequestPrd = FetchRequest<Product>(sortDescriptors: [], predicate: nil)
//    }
}

struct CartPageView_Previews: PreviewProvider {
    static var cartVM : CartViewModel = {
        let cartVM = CartViewModel()
        cartVM.data = CartViewModel.dataSample
        cartVM.totals = CartViewModel.totalsSample
        cartVM.countPrd = 1
        cartVM.dicPrd = ["0": "0"]
        return cartVM
    }()
    static var previews: some View {
        CartPageView()
            .environmentObject(cartVM)

    }
}
