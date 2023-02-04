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
    
    
    @Binding var flag: Bool
    @Binding var searchText: String
    
    init(withFlag: Binding<Bool>, withSearchText: Binding<String>) {
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
    
}

//struct ToolbarHome_Previews: PreviewProvider {
//    @State static var flag = false
//    @State static var searchText = ""
//
//    static var previews: some View {
//        ToolbarHome(flag: $flag, searchText: $searchText)
//    }
//}
