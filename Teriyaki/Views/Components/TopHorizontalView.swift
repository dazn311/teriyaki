//
//  TopHorizontalView.swift
//  Teriyaki
//
//  Created by dazn311 on 07.02.2023.
//

import SwiftUI

struct TopHorizontalView: View {
    var catss: [CatAndPrd]
//    @EnvironmentObject var tabStateManager: TabStateManager
    @ObservedObject var tabStateVM: TabStateManager
    var body: some View {
        HStack {
            ScrollViewReader { proxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(catss,  id: \.name) { categ in
                            Button {
                                tabStateVM.currSubCategory = categ.id
                            } label: {
                                HStack (spacing: 1) {
                                    Text("\(categ.name)")
                                        .foregroundColor(ThemeApp.gold) // If you have this
                                        .frame(maxHeight: 26)
                                        .padding(.horizontal,6)
                                        .padding(.vertical, 2)
                                        .clipped()
                                    Text("|")
                                        .opacity(0.4)
                                }
                            }
                            .id(categ.name)
                            .cornerRadius(4)
                        }
                        
                    }
                }
#if os(iOS)
                .onChange(of: tabStateVM.currSubCategoryTop, perform: { (value) in
                    withAnimation {
                        proxy.scrollTo(value, anchor: .center)
                    }
                })
#endif
            }
        }
    }
}

//struct TopHorizontalView_Previews: PreviewProvider {
//    static var previews: some View {
//        TopHorizontalView()
//    }
//}
