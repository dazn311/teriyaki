
import SwiftUI

struct FavoritePageView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest var fetchRequestPrd: FetchedResults<Product>
    
    var body: some View {
        VStack {
            Text("Избранные")
            
            List(["Избранные"], id: \.self) { cat in
                Section(cat) {
                    ForEach(fetchRequestPrd, id: \.self) { prd in
                        HStack {
                            AsyncImage(url: URL(string: prd.url)) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 44)
                                .background(Color.gray)
                                .clipShape(Rectangle())
                                
                            Text("\(prd.wrappedName)")
                            Text("\(prd.wrapPrice)")
                        }
                    }
                    .onDelete { IndexSet in
                        print("del: \(IndexSet)")
                        self.deleteTodo(prds: Array(fetchRequestPrd), offesets: IndexSet)
                    }
                }
            }
        }
    }
    
    init(filter: String) {
        _fetchRequestPrd = FetchRequest<Product>(sortDescriptors: [SortDescriptor(\.price)], predicate: nil)
//        _fetchRequestPrd = FetchRequest<Product>(sortDescriptors: [], predicate: nil)
//        _fetchRequestPrd = FetchRequest<Product>(sortDescriptors: [], predicate: NSPredicate(format: "parentID BEGINSWITH %@", filter))
    }
    
    func deleteTodo(prds: [Product], offesets: IndexSet){
        for index in offesets {
          let prd = prds[index]
            viewContext.delete(prd)
        }
        try? viewContext.save()
    }
}

//struct CartPageView_Previews: PreviewProvider {
//    static var previews: some View {
//        CartPageView(fetchRequestPrd: FetchedResults<Product>())
//
//    }
//}
