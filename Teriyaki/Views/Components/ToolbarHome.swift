//
//  ToolbarHome.swift
//  Teriyaki
//
//  Created by dazn311 on 25.01.2023.
//

import SwiftUI
import CoreData

struct ToolbarHome: View {
    @Environment(\.managedObjectContext) var moc
    
    @EnvironmentObject var prdVM : ProductsListViewModel
    @EnvironmentObject var catsVM : CategoriesListViewModel
    
    @FetchRequest var fetchRequestVersion: FetchedResults<VersionDataEntity>
    
    @Binding var flag: Bool
    @Binding var searchText: String
    
    init(withFlag: Binding<Bool>, withSearchText: Binding<String>) {
        _fetchRequestVersion = FetchRequest<VersionDataEntity>(sortDescriptors: [SortDescriptor(\.apiCategory)], predicate: nil)
        self._flag = withFlag
        self._searchText = withSearchText
    }

    var body: some View {
        ZStack{
            HStack {
                Group {
                    switch catsVM.state {
                        case .fetched:
                            HStack(alignment: .center) {
                                MenuCuisine(prdParentId: $prdVM.parentId)
                                    .environmentObject(catsVM)
                            }
                            .clipped()
                        case .initional:
                            Text("init")
                            .onAppear {
                                
                                catsVM.fetchCats(for: "/catstoplevel", version: "3") {ver2 in
                                    print("version from server: \(ver2)")
                                    if isExist(version: ver2) {
                                        print("good save")
                                    }
                                }
                            }
                        case .fetching:
                            Text("fetching...")
                        case .error(_):
                            Text("all")
                            .foregroundColor(Color.pink)
                    }
                }
                .frame(minWidth: 100, idealWidth: 100, maxWidth: 100, minHeight: 50, idealHeight: 50, maxHeight: 50, alignment: .center)
                
                Spacer()
                    .frame(width: flag == false ?(UIScreen.main.bounds.size.width / 2) - 140 : 2)

                

                  if flag {
                      SearchBar(searchText: $searchText, flag: $flag)
                      .frame(maxWidth: .infinity, maxHeight: .infinity)

                  } else {
                    Spacer()
                      .frame(minWidth: 10)

                    Button {
                        withAnimation(.spring()) {
                            flag = true }
                    } label: {
                      Image(systemName: "text.magnifyingglass")
                            .foregroundColor(Color.gray)
                    }

                    Button {
                        callNumber(phoneNumber: "+74950980409")
                    } label: {
                      Image(systemName: "phone.connection")
                            .foregroundColor(Color.gray)
                    }

                  }
            
            }
            Logo(flag: $flag)
        }
    }//end body
    
    
    
    private func callNumber(phoneNumber: String) {
        guard let url = URL(string: "telprompt://\(phoneNumber)"),
            UIApplication.shared.canOpenURL(url) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    func isExist(version: Int) -> Bool {
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "VersionDataEntity")
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "VersionDataEntity", sortDescriptors: [SortDescriptor(\.apiCategory)], predicate: true)
//        fetchRequest.predicate = NSPredicate(format: "productID = %d", argumentArray: [productID])

//        let res = try! moc.fetch(fetchRequest)
//        print("108 res.count: \(res.count)")
        
        var tmpVersion = 0
        for ver in fetchRequestVersion {
            print("version apiCategory: \(ver.category)")
            if tmpVersion < Int(ver.category)! {
                tmpVersion = Int(ver.category)!
            }
        }
        
        if tmpVersion < version {
            let v2 = VersionDataEntity(context: moc)
            v2.apiCategory = String(version)
            v2.apiProducts = "0"
            
            do {
                try moc.save()
                print("moc save: v2.apiCategory: \(version)")
            } catch {
                let nsError = error as NSError
                print("119-error: \(nsError)")
            }
            return true
        } else {
            return false
        }
        
//        return res.count > 0 ? true : false
    }
    
}

//struct ToolbarHome_Previews: PreviewProvider {
//    @State static var flag = false
//    @State static var searchText = ""
//
//    static var previews: some View {
//        ToolbarHome(flag: $flag, searchText: $searchText)
//    }
//}
