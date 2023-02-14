//
//  PrdPreviewView.swift
//  Teriyaki
//
//  Created by dazn311 on 06.02.2023.
//

import SwiftUI

struct PrdPreviewView: View {
    @Environment(\.managedObjectContext) private var viewContext
    var product: ProductFromCatalog? = nil
    var catID: String = ""
    var isShowPrice: Bool = false
    
    var body: some View {
        if let prd = product {
            
//            ScrollView(showsIndicators: false) {
                VStack(spacing: 1) {
                    NavigationLink(destination: ItemPrd(product: prd)) {
                        VStack {
                            CacheAsyncImage(id: prd.id, url: URL(string: prd.thumb)!) { AsyncImagePhase in
                                switch AsyncImagePhase {
                                case .success(let image):
                                    image
                                        .resizable()
                                        .scaledToFill()
//                                        .scaledToFit()
                                case .empty:
                                    Image("\(prd.id)")
                                        .resizable()
                                        .scaledToFill()
//                                        .clipped()
                                case .failure(_):
                                    Image("\(prd.id)")
                                        .resizable()
                                        .scaledToFill()
//                                        .clipped()
                                @unknown default:
                                    Image("\(prd.id)")
                                        .resizable()
                                        .scaledToFill()
//                                        .clipped()
                                }
                                
                            }//MARK: end VStack
                            
                            VStack(alignment: .leading, spacing: 0) {
                                Text("\(prd.name)")
                                    .foregroundColor(Color(red: 205 / 255, green: 91 / 255, blue: 15 / 255)) // If you have this
                                    .frame(maxWidth: .infinity, minHeight: 44, maxHeight: 44, alignment: .topLeading)
                                    .padding(.horizontal, 0)
                                Spacer()
                            }//MARK: end VStack
                            .padding(.vertical, 0)
                            .padding(.horizontal, 4)
                            .frame(maxWidth: .infinity, minHeight: 44, maxHeight: 44, alignment: .leading)
//                            Spacer()
//                                .onAppear {
//                                    print("prd-\(prd.id)-\(prd.name) (\(catID))")
//                                }
                        }//MARK: end VStack
                        .padding(.horizontal,0)
                    }//MARK: end Nav
//                    .background(Color.green)
                    BtnPay(prd: prd, catID: catID)
                        .padding(.horizontal, 4)
                        .padding(.bottom, 16)
                        .environment(\.managedObjectContext, viewContext)
                }
                .background(Color.gray.opacity(0.1))
                .frame(maxWidth: .infinity)
//                Spacer()
//            }//MARK: end ScrollView
        }
    }
}

//struct PrdPreviewView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            VStack {
//                PrdPreviewView(tabStateVM: tabStateVM, product: prd11, isShowPrice: true)
//                .preferredColorScheme(.dark)
//                .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//            }
//            .frame(width: 300, height: 400)
//            
//            PrdPreviewView(product: prd11, isShowPrice: true)
//                .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//        }
//    }
//}

let prd11 = ProductFromCatalog(id: "1", thumb: "https://teriyaki.su/image/cache/catalog/China/Donpauk-300x200.jpg", name: "Донпаюк", description: "Грудинка свиная, микс салат, специальный соус450г", price: "2 500р", jan: "", sortOrder: "1", viewed: "564", categoryID: "78", rating: 2, href: "http://teriyaki.su//kitaiskaya-kuhnya/goryachie_blyuda_kitaiskaya?product_id=100")
