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
    @Namespace var animation
    
    var body: some View {
        HStack {
            ScrollViewReader { proxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(catss,  id: \.name) { categ in
                            Button {
                                tabStateVM.bottomChange(id: categ.id)
                            } label: {
                                HStack (spacing: 0) {
                                    VStack {
                                        Text("\(categ.name)")
                                            .foregroundColor(tabStateVM.currSubCategoryTop == categ.id ? ThemeApp.gold : .gray) // If you have this
                                            .frame(maxHeight: 26)
                                            .padding(.horizontal,0)
                                            .padding(.vertical, 0)
                                            .clipped()
                                        
                                        if tabStateVM.currSubCategoryTop == categ.id {
                                        Capsule()
                                            .fill(.gray)
                                            .matchedGeometryEffect(id: "categ", in: animation, properties: .position)
                                            .frame(height: 2)
                                            .padding(.horizontal, -20)
                                            .opacity(0.5)
                                            .offset(x: 0, y: -10)
                                        } else {
                                            Capsule()
                                                .fill(.clear)
                                                .frame(height: 2)
                                                .padding(.horizontal, -20)
                                                .opacity(0.5)
                                                .offset(x: 0, y: -10)
                                        }
                                        
                                    }
//                                    Text("|")
//                                        .opacity(0.4)
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
