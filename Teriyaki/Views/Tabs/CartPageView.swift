import SwiftUI

struct CartPageView: View {
    @FetchRequest var fetchRequestPrd: FetchedResults<Product>
    
    var body: some View {
        VStack {
            Text("CartPage")
            
            List(fetchRequestPrd, id: \.self) { prd in
                Section(prd.wrappedName) {
                    Text("\(prd.wrappedName)")
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
