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
            )
            {
            ForEach(catsVM.data,  id: \.categoryID) { catObj in
                HStack {
                    Text("\(catObj.name)")
                        .tag(catObj.categoryID)
                        .foregroundColor(catObj.categoryID == prdParentId ? Color(.red): Color(colorScheme == .dark ?.white : .black))
                        .padding(.vertical,4)
                        .cornerRadius(6)
                }
            }
                
            }
            .accentColor(.red)
            .pickerStyle(MenuPickerStyle())
    //            .tint(Color.red)
        
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
