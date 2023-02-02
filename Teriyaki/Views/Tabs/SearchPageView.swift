//
//  SearchPageView.swift
//  Teriyaki
//
//  Created by dazn311 on 31.01.2023.
//

import SwiftUI

struct SearchPageView: View {
    @Environment(\.colorScheme) var colorScheme
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
                                                NavigationLink(destination: ItemPrd(name: prd.name, pic: prd.thumb, describe: prd.description, price: prd.price)) {
                                                    Text(prd.name)
                                                        .foregroundColor(Color.gray)
                                                }
                                            }
                                        }
                                    }
                                    .listStyle(.plain)
                                }
                            }
                        case .initional:
                            Text("init")
                        case .fetching:
                            Text("fetching...")
                        case .error(_):
                            Text("all")
                            .foregroundColor(Color.pink)
                    }
                }
            }
            .padding(.horizontal,4)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    ToolbarHome(flag: $flag, searchText: $prdVM.searchTerm)
                        .environmentObject(prdVM)
                }
            }
            Spacer()
        }//end navigation
    }
}

