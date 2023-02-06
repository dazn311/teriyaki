import SwiftUI

struct SearchPageView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var prdVM : ProductsListViewModel
    
    private var columns: [GridItem] = [GridItem(spacing: 4, alignment: .center),GridItem(spacing: 4, alignment: .center)]
    private var columnsSingel: [GridItem] = [GridItem()]
    
    @State var flag = false
    @State var offset: CGPoint = .zero


    var body: some View {
        
        NavigationView {
            VStack {
                Group {
                    switch prdVM.state {
                        case .fetched:
                            if let catss = prdVM.dataArr[prdVM.parentId] {
                                ScrollView(showsIndicators: false) {
                                    LazyVStack {
                                        ForEach(catss,  id: \.id) { categ in
                                            Text(categ.name)
                                                .foregroundColor(Color.indigo)
                                            
                                            ForEach(categ.products,  id: \.id) { prd in
                                                NavigationLink(destination: ItemPrd(product: prd, isShowPrice: true)
                                                    .environment(\.managedObjectContext, viewContext)
                                                )
                                                {
                                                    Text(prd.name)
                                                    .foregroundColor(Color.gray)
                                                }
                                                .tag(prd.id)
                                            }
                                        }
                                    }
                                    .listStyle(.plain)
                                }
                            }
                        case .initional:
                            Text("init")
                        case .fetching:
                            VStack {
                                ProgressView()
                                Text("fetching...")
                            }
                        case .error(_):
                            Text("all")
                            .foregroundColor(Color.pink)
                    }
                }
            }
            .padding(.horizontal,4)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    ToolbarHome(withFlag: $flag, withSearchText: $prdVM.searchTerm)
                        .environmentObject(prdVM)
                }
            }
            Spacer()
        }//end navigation
    }
}

