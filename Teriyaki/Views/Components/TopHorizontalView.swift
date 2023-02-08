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
//    @EnvironmentObject var tabStateManager: TabStateManager
    @ObservedObject var tabStateVM: TabStateManager
    @State private var cancellables: Set<AnyCancellable> = []
    
    var body: some View {
        HStack {
            ScrollViewReader { proxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(catss,  id: \.name) { categ in
                            Button {
                                tabStateVM.currSubCategory = categ.id
                                tabStateVM.priorySubCategory = "top"
                                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)) {
                                    tabStateVM.currSubCategoryTop = categ.id
                                    tabStateVM.priorySubCategory = "bottom"
                                }
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
                    withAnimation {
//                        print("53 Top proxy: \(id)")
                        proxy.scrollTo(id, anchor: .center)
                    }
                    // When the lastMessageId changes, scroll to the bottom of the conversation
//                    tabStateVM.$currSubCategoryTop.debounce(for: .seconds(0.2), scheduler: RunLoop.main)
//                        .sink { _ in
//                            withAnimation {
//                                print("53 proxy: \(id)")
//                                proxy.scrollTo(id, anchor: .center)
//                            }
//                        }.store(in: &cancellables)
                }
                
                
                
//                .onChange(of: tabStateVM.currSubCategoryTop, perform: { (value) in
//                    DispatchQueue.main.async {
//                    withAnimation {
//                        proxy.scrollTo(value, anchor: .center)
//                    }
//                    }
//                })
                
                
                
            }
        }
    }
}

//struct TopHorizontalView_Previews: PreviewProvider {
//    static var previews: some View {
//        TopHorizontalView()
//    }
//}
