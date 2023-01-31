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
    @Binding var parentId: String
    
    var body: some View {
        VStack {
            Picker("select", selection: $parentId) {
                ForEach(catsVM.categoriesArr,  id: \.categoryID) { catObj in
                
                    Button {
                        parentId = catObj.categoryID
                    } label: {
                        Text(catObj.name)
                            .foregroundColor(catObj.categoryID == parentId ? Color(.red): Color(colorScheme == .dark ?.white : .black))
                           
                    }
                }
            }
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
