//
//  TopHorizontalView.swift
//  Teriyaki
//
//  Created by dazn311 on 07.02.2023.
//

import SwiftUI
import Combine

struct TopHorizontalView: View {
    var catss: [CatAndPrd]
    @ObservedObject var tabStateVM: TabStateManager
    
    var body: some View {
        HStack {
            ScrollViewReader { proxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(catss,  id: \.name) { categ in
                            Button {
                                tabStateVM.bottomChange(id: categ.id)
                            } label: {
                                HStack (spacing: 1) {
                                    Text("\(categ.name)")
                                        .foregroundColor(tabStateVM.currSubCategoryTop == categ.id ? ThemeApp.gold : .gray) // If you have this
                                        .frame(maxHeight: 26)
                                        .padding(.horizontal,6)
                                        .padding(.vertical, 2)
                                        .clipped()
                                    Text("|")
                                        .opacity(0.4)
                                }
                            }
                            .id(categ.id)
                            .cornerRadius(4)
                        }
                        
                    }
                }
                .onChange(of: tabStateVM.currSubCategoryTop) { id in
                    DispatchQueue.main.async {
                        withAnimation {
                            proxy.scrollTo(id, anchor: .center)
                        }
                    }
                }
            }
        }
    }
}
