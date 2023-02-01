//
//  MenuCuisine.swift
//  Teriyaki
//
//  Created by dazn311 on 25.01.2023.
//

import SwiftUI

struct MenuCuisine: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var catsVM : CategoriesListViewModel
    @Binding var prdParentId: String
    
    var body: some View {
        HStack {
            Picker("",selection: $prdParentId
            ) {
                    ForEach(catsVM.data,  id: \.categoryID) { catObj in
                        HStack {
                            Text("\(catObj.name)")
                                .tag(catObj.categoryID)
                                .foregroundColor(catObj.categoryID == prdParentId ? Color(.red): Color(colorScheme == .dark ?.white : .black))
                                .padding(.vertical,4)
                                .cornerRadius(6)
                                
//                            Image(systemName: catObj.categoryID == "70" ? "" : "arrow.up.arrow.down.square")
//                                .resizable()
//                                .font(Font.system(size: 12))
//                                .frame(maxWidth: 10, maxHeight: 10, alignment: .leading)
                        }
//                        .background(Color.white.opacity(0.4))
                        
                    }
                
            }
            .accentColor(.red)
//            .tint(Color.red)
            .pickerStyle(MenuPickerStyle())
//            .background(Color.white.opacity(0.2))
//            .clipped()
//            .padding(.horizontal, 6)
        
        }
        
        
    }
}

//struct MenuCuisine_Previews: PreviewProvider {
//    static var previews: some View {
//        MenuCuisine()
//    }
//}


//private func transformName(name: String)-> String {
//    if name.contains(" ") {
//        return name.components(separatedBy: " ").first ?? "***"
//    }
//    return name
//}
