//
//  HomePage.swift
//  Teriyaki
//
//  Created by dazn311 on 25.01.2023.
//

import SwiftUI

//let columns: [GridItem] = [GridItem(spacing: 4, alignment: .center),GridItem(spacing: 4, alignment: .center)]
let columnsSingel: [GridItem] = [GridItem()]

struct HomePage: View {
//    @Environment(\.colorScheme) var colorScheme
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var prdVM : ProductsListViewModel
//    @EnvironmentObject var tabStateManager: TabStateManager
    @ObservedObject var tabStateVM: TabStateManager
    
    @State var flag = false
    @State var offset: CGPoint = .zero
    
    

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                //                Text("gesdf")
                
                if prdVM.state == .fetched {
                    if let catss = prdVM.dataArr[prdVM.parentId] {
                        VStack {
#if os(iOS)
                            TopHorizontalView(catss: catss,tabStateVM: tabStateVM)
#endif
                            ScrollViewReader { proxy in
                                ScrollView(showsIndicators: false) {
                                    ForEach(catss,  id: \.id) { categ in
                                        GridHomeView(tabStateVM: tabStateVM,categ: categ)
                                            .id(categ.id)
                                    }
                                }// end ScrollView
                                .onChange(of: tabStateVM.currSubCategory, perform: { (value) in
                                    withAnimation {
                                        proxy.scrollTo(value, anchor: .top)
                                    }
//                                    detectIos22()
                                })
                            }
                        }
                    }//end ScroolReader
                }else {
                    EmptyView()
                }
                Spacer()
            }
            .padding(.horizontal,4)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                
#if os(iOS)
                ToolbarItem(placement: .principal) {
                    ToolbarHome(withFlag: $flag, withSearchText: $prdVM.searchTerm)
                }
#endif
                // add scrool bottom menu for show status;
                //                ToolbarItem(placement: .status) {
                //                    Text("status").padding(4)
                //                }
            }
            
            
        }//end navigation
        .accentColor(ThemeApp.gold)
    }
//    func detectIos22() {
//    #if targetEnvironment(macCatalyst)
//        print("UIKit running on macOS")
//    #else
//        print("Your regular code")
//    #endif
//    }
}


private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .short
    return formatter
}()

//struct HomePage_Previews: PreviewProvider {
//    static let prdVM : ProductsListViewModel = {
//       let prdVM = ProductsListViewModel()
//        prdVM.parentId = "70"
//        let catAndPrd: CatAndPrd = CatAndPrd(name: "sdf", thumb: "dsf", parentID: "70", id: "1", sortOrder: "1", products: [])
//        prdVM.dataArr = ["70": [catAndPrd]]
//        return prdVM
//    }()
//
//    static var previews: some View {
//        ContentView()
//            .environment(\.colorScheme, .dark)
//            .environmentObject(prdVM)
//            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}
    
    
    
    
    
    
    
    
    
    
    

//private func addItem() {
//    withAnimation {
//        let newItem = Item(context: viewContext)
//        newItem.timestamp = Date()
//
//        do {
//            try viewContext.save()
//        } catch {
//            // Replace this implementation with code to handle the error appropriately.
//            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//            let nsError = error as NSError
//            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//        }
//    }
//}
//
//private func deleteItems(offsets: IndexSet) {
//    withAnimation {
//        offsets.map { items[$0] }.forEach(viewContext.delete)
//
//        do {
//            try viewContext.save()
//        } catch {
//            // Replace this implementation with code to handle the error appropriately.
//            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//            let nsError = error as NSError
//            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//        }
//    }
//}


//                }

//    func closuresFetchPrd(parentId: String) {
//        categoriesVM.statusFetchPrd = .fetching
//
//        categoriesVM.fetchProductsFromCat(parentId: parentId, completion: { error in
//            if let error = error {
//                categoriesVM.statusFetchPrd = .error("Error: not completion fetchPrdFromCat")
//                print("fetchProductsFromCat:\(error.localizedDescription)")
//                return
//            }
//        })
//    }


    //                if let cats = categoriesVM.dataCategories {
    //                        let curCatalog = categoriesVM.dataCategories.filter({ parent in
    //                            parent.parentID == parentId
    //                        }).sorted { a, b in
    //                            Int(a.sortOrder)! < Int(b.sortOrder)!
    //                        }
    //                        let col = curCatalog.count > 1 ? columns : columnsSingel
                            
    //                        let searchCatalog = searchText != "" ? curCatalog.filter({ parent in
    //                            parent.name.localizedLowercase.contains(searchText.localizedLowercase)
    //                        }) : curCatalog
    
    
    
    
    
    
    //                            let heightLogo2 = min(CGFloat(200), CGFloat(200 - max(2, offset.y)))
//                                let heightLogo2 = CGFloat(100)
//                                Image("logo22")
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fill)
//                                    .frame(width: max(CGFloat(10),heightLogo2), height: max(CGFloat(10),heightLogo2))
//                                    .clipShape(Circle())
                            
                    
                            
    //    @State var startOffset: CGPoint = .zero
    //    @State var titleOffset: CGFloat = 0
                            
