//
//  GridView.swift
//  Teriyaki
//
//  Created by dazn311 on 07.02.2023.
//

import SwiftUI

struct GridHomeView: View {
    @ObservedObject var tabStateVM: TabStateManager
    var categ: CatAndPrd
    
    @State var startOffset: CGPoint = .zero
    
    var body: some View {
        VStack {
            Section("\(categ.name)"){
                VStack(alignment: .center) {
                    LazyVGrid(columns: columns, spacing: 2) {
//                        ForEach(categ.products,  id: \.id) { prdObj in
                        ForEach(categ.products.filter{ Int($0.id)! > 120 || Int($0.id)! < 80 },  id: \.id) { prdObj in
                            VStack(spacing: 0) {
                                PrdPreviewView(product: prdObj, catID: categ.id, isShowPrice: true)
                                    .id("prd-\(prdObj.id)")
                                    .task {
                                        tabStateVM.topChange(id: categ.id)
//                                        if Int(prdObj.id)! < 120 && Int(prdObj.id)! > 80 {
//                                            print("prd: \(prdObj.id)-\(prdObj.name)")
//                                        }
                                    }
                            }
                        }
                    }//end lazyVGrid
                }
            }
        }
//        .modifier(OffsetModifier(tabVM: tabStateVM, categ: categ))
    }
}

//prd: 112-Тядян покым паб
//prd: 108-Жареный рис с креветками
//prd: 87-Пульгоги
//prd: 83-Со яннём кальби
//prd: 84-Яннём моксал гуи
//prd: 89-Сундэ покым
//prd: 82-Сундэ
//prd: 90-Тубу-кимчи
//prd: 86-Чеюк покым L
//prd: 85-Чеюк покым S
//prd: 96-Чукуми покым



//prd: 94-Дакгалби S
//prd: 95-Дакгалби L
//prd: 91-Таканжон
//prd: 93-Оджино яче покым
//prd: 87-Пульгоги
//prd: 84-Яннём моксал гуи
//prd: 83-Со яннём кальби
//prd: 89-Сундэ покым
//prd: 82-Сундэ
