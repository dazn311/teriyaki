//
//  OffsetModifier.swift
//  Teriyaki
//
//  Created by dazn311 on 09.02.2023.
//

import SwiftUI

struct OffsetModifier: ViewModifier {
    @ObservedObject var tabVM: TabStateManager
    var categ: CatAndPrd
    
    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { proxy in
                    Color.clear
                        .preference(key: OffsetKey.self, value: proxy.frame(in: .named("scroll")))
                }
            )
            .onPreferenceChange(OffsetKey.self) { proxy in
                let offset = proxy.midY
//                print(categ.name)
//                print(categ.id)
//                print(offset)
//                print(tabVM.currSubCategoryTop)
                withAnimation {
                    tabVM.currSubCategoryTop = (offset < 1800 && offset > 1100 && tabVM.currSubCategoryTop != tabVM.currSubCategory) ? categ.id : tabVM.currSubCategoryTop
                    print(tabVM.currSubCategoryTop)
                }
            }
    }
}

