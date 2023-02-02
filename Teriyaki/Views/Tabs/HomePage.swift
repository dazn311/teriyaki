//
//  HomePage.swift
//  Teriyaki
//
//  Created by dazn311 on 25.01.2023.
//

import SwiftUI

struct HomePage: View {
//    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var prdVM : ProductsListViewModel
    
    private var columns: [GridItem] = [GridItem(spacing: 4, alignment: .center),GridItem(spacing: 4, alignment: .center)]
    private var columnsSingel: [GridItem] = [GridItem()]
    
    @State var flag = false
    @State var offset: CGPoint = .zero

    var body: some View {
        
        NavigationView {
            VStack {
//                Image("101")
                ScrollView(showsIndicators: false) {
                    if prdVM.state == .fetched {
                        if let catss = prdVM.dataArr[prdVM.parentId] {
                            LazyVStack {
                                ForEach(catss,  id: \.id) { categ in
                                    Text(categ.name)
                                        .foregroundColor(Color.indigo)

//                                    let col = searchProducts.count > 1 ? columns : columnsSingel
                                    LazyVGrid(columns: columns, spacing: 0) {
                                                ForEach(categ.products,  id: \.id) { prdObj in
                                                    VStack(spacing: 0) {
                                                        NavigationLink(destination: ItemPrd(id: prdObj.id ,name: prdObj.name, pic: prdObj.thumb, describe: prdObj.description, price: prdObj.price, isShowPrice: true)) {
                                                            ItemPrd(id: prdObj.id ,name: prdObj.name, pic: prdObj.thumb, describe: prdObj.description, price: prdObj.price, isShowPrice: false)
                                                        }
                                                        BtnPay(price: prdObj.price)
                                                    }
                                                }
                                    }//end lazyVGrid
                                    
                                }
                            }
                            .listStyle(.plain)
                        }
                    }else {
                        EmptyView()
                    }
                }
            }
            .padding(.horizontal,4)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    ToolbarHome(flag: $flag, searchText: $prdVM.searchTerm)
//                        .environmentObject(prdVM)
                }
            }
            Spacer()
        }//end navigation
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .short
    return formatter
}()

struct HomePage_Previews: PreviewProvider {
    static let categoriesVM : ProductsListViewModel = {
       let categoriesVM = ProductsListViewModel()
        return categoriesVM
    }()
    
    static var previews: some View {
        ContentView()
            .environment(\.colorScheme, .dark)
            .environmentObject(categoriesVM)
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    

//                Button("Add prd") {
//                    let SoGalBi = Product(context: moc)
//                    SoGalBi.description2 = "Grilled beef ribs.500g"
//                    SoGalBi.href = "https://teriyaki.su/index.php?route=product/product&product_id=83"
//                    SoGalBi.jan = ""
//                    SoGalBi.name = "So GalBi"
//                    SoGalBi.parentID = "70"
//                    SoGalBi.price = "2600P"
//                    SoGalBi.minimum = "0"
//                    SoGalBi.model = "ss"
//                    SoGalBi.productID = "83"
//                    SoGalBi.rating = 5
//                    SoGalBi.special = false
//                    SoGalBi.tax = "200"
//                    SoGalBi.thumb = "https://teriyaki.su/image/cache/catalog/Korean/Hot/SoGalBi-200x200.jpg"
//
//
//                    do {
//                        try moc.save()
//                    } catch {
//                        let nsError = error as NSError
//                        print("error2: \(nsError)")
////                        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//                    }
//
//                }
//
//                FilteredListPrd(filterKey: "parentID", filterValue: categoriesVM.parentId) { (product: Product) in
//                    Text("\(String(describing: product.wrappedDescription)) / price: \(product.wrapPrice)")
//                }
//                .frame(maxHeight: 200)



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


//                        VStack {
//                            //sb categories;
//                            ScrollView (.horizontal, showsIndicators: false) {
//                                 HStack {
//                                     ForEach(searchCatalog,  id: \.categoryID) { catObj in
//
//                                         Button {
//        //                                         parentId = catObj.category_id
//                                             print(catObj.categoryID)
//                                         } label: {
//                                             Text(catObj.name.split(separator: "-").last!)
//                                                 .foregroundColor(catObj.parentID == "0" ? Color(.red): Color(.black))
//                                                 .frame(maxWidth: .infinity, maxHeight: 30)
//                                                 .padding(5)
//                                                 .padding(.top, 2)
//                                                 .padding(.bottom, 2)
//                                                 .overlay(
//                                                     RoundedRectangle(cornerRadius: 4)
//                                                         .stroke(Color.white, lineWidth: 1))
//
//                                         }
//                                         .background(Color.yellow) // If you have this
//                                         .cornerRadius(4)         // You also need th
//                                     }
//                                 }
//                            }
//                            .frame(height: 30)
//
//                            Spacer()
//                        }


//toolsBar;
//                    VStack{
//                        HStack {
//                            Spacer()
//                                .frame(width: flag == false ?(UIScreen.main.bounds.size.width / 2) - 34 : 10)
////                                                    if offset.y > 150 {
////                                                let heightLogo = min(CGFloat(36), 10 + max(2, offset.y))
//                                let heightLogo = CGFloat(36)
//                                withAnimation(.spring()) {
//                                    Image("logo22")
//                                        .resizable()
//                                        .aspectRatio(contentMode: .fill)
//                                        .frame(width: heightLogo, height: heightLogo)
//                                        .clipShape(Circle())
//                                }
//
////                                                    }
//
//                              if flag {
//                                SearchBar(searchText: $searchText, flag: $flag)
//                                  .frame(maxWidth: .infinity, maxHeight: .infinity)
//
//
//                              } else {
//                                  Spacer()
//                                      .frame(minWidth: 10)
//
//                                Button {
//                                    withAnimation(.spring()) { flag = true }
//                                } label: {
//                                  Image(systemName: "text.magnifyingglass")
//                                        .foregroundColor(Color.gray)
//                                }
//
//                                Button {
//                                } label: {
//                                  Image(systemName: "phone.connection")
//                                        .foregroundColor(Color.gray)
//                                }
//
//                              }
//                            }
//
//                    }

    
 
 
//                            if categoriesVM.statusFetchPrd == .fetched {
//                                //sub categories;
//                                ScrollView(showsIndicators: false) {
//                                    ForEach(curCatalog,  id: \.categoryID) { catObj in
//                                        let curProducts = categoriesVM.dataProducts.filter({ prd in
//                                            prd.parentID == catObj.categoryID
//                                        })
//
//                                        let searchProducts = searchText != "" ? curProducts.filter({ prd in
//                                            prd.name.localizedLowercase.contains(searchText.localizedLowercase) ||
//                                            prd.description.localizedLowercase.contains(searchText.localizedLowercase) ||
//                                            prd.model.localizedLowercase.contains(searchText.localizedLowercase)
//                                        }) : curProducts
//
//                                        LazyVStack {
//                                                Text(catObj.name.split(separator: "-").last!)
//                                                .foregroundColor(colorScheme == .dark ? Color(.white): Color(.black))
//                                                    .frame(maxWidth: .infinity)
//
//                                            Rectangle()
//                                                .fill(Color.gray.opacity(0.6))
//                                                .frame(height: 0.5)
//
//                                            //products list;
//                                            let col = searchProducts.count > 1 ? columns : columnsSingel
//
//                                            LazyVGrid(columns: col, spacing: 0) {
//
//                                                        ForEach(searchProducts,  id: \.productID) { prdObj in
//                                                            ItemPrd(name: prdObj.name, pic: prdObj.thumb, describe: prdObj.description, price: prdObj.price)
//
//                                                        }
//
//                                            }//end lazyVGrid
//    //                                        .overlay (
//    //                                            GeometryReader{proxy -> Color  in
//    //                                               let rect = proxy.frame(in: .global)
//    //                                                if startOffset == .zero {
//    //                                                    DispatchQueue.main.async {
//    //                                                        startOffset = CGPoint(x: rect.minX, y: rect.minY + 20)
//    //                                                    }
//    //                                                }
//    //
//    //                                               DispatchQueue.main.async {
//    //                                                   offset = CGPoint(x: startOffset.x - rect.minX, y: startOffset.y - rect.minY)
//    //            //                                       print(offset)
//    //                                               }
//    //
//    //                                               return Color.clear
//    //                                            }
//    //                                            .frame(width: 0, height: 0)
//    //                                            , alignment: .top
//    //
//    //                                        ) //end overlay for sub categories;
//
//                                        }// end LazyVStack
//    //                                    .id(catObj.name)
//                                        .frame(maxWidth: .infinity, maxHeight: searchProducts.count > 0 ? .infinity : 0)
//    //                                    .background(Color.green)
//
//                                    }//end forEach
//                                }
//
////                            }// end if dataPrd
//                            } else {
//                                Text("Loading Products...")
//                            }
//
//                            if categoriesVM.dataProducts.count == 0 {
//                                Text("not products")
//                            }
 


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
                            
