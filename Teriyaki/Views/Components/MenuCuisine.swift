//
//  MenuCuisine.swift
//  Teriyaki
//
//  Created by dazn311 on 25.01.2023.
//

import SwiftUI

struct MenuCuisine: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var categoriesVM : CategoryesHomeModel
    @Binding var parentId: String
    
    var body: some View {
        VStack {
            Picker("select", selection: $parentId) {
                ForEach(categoriesVM.dataCategories.filter({ parent in
                    parent.parentID == "0"
                }).sorted(by: {$0.sortOrder < $1.sortOrder}),  id: \.categoryID) { catObj in
                
                    Button {
                        parentId = catObj.categoryID
                    } label: {
                        Text(transformName(name: catObj.name))
                            .foregroundColor(catObj.categoryID == parentId ? Color(.red): Color(colorScheme == .dark ?.white : .black))
                           
                    }
                }
            }
        }
    }
    
    private func transformName(name: String)-> String {
        if name.contains(" ") {
            return name.components(separatedBy: " ").first ?? "***"
        }
        return name
    }
}

//struct MenuCuisine_Previews: PreviewProvider {
//    static var previews: some View {
//        MenuCuisine()
//    }
//}
