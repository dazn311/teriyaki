//
//  SearchBar.swift
//  Teriyaki
//
//  Created by dazn311 on 24.01.2023.
//

import SwiftUI

struct SearchBar: View {

    @Binding var searchText: String
    @Binding var flag: Bool
    
    var body: some View {
            HStack {
                NeumorphicStyleTextField(textField: TextField("Search...", text: $searchText), imageName: "magnifyingglass")
                Button("✖︎") {
                    withAnimation(.spring()) {
                        searchText = ""
                        UIApplication.shared.endEditing()
                        flag = false
                        
                    }
                }.foregroundColor(Color.gray)
            }
    }
}

//struct SearchBar_Previews: PreviewProvider {
//    @State static var searchText = "search text"
//    @State static var flag = false
//    @State static var showKeyBoard = false
//    static var previews: some View {
//        SearchBar(searchText: $searchText, flag: $flag, showKeyBoard: $showKeyBoard)
//    }
//}

enum FocusField: Hashable {
    case field
  }

struct NeumorphicStyleTextField: View {
    
    var textField: TextField<Text>
    var imageName: String
    
    @FocusState private var focusedField: FocusField?
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
            textField
                .focused($focusedField, equals: .field)
                
        }
        .padding()
        .cornerRadius(6)
        .task {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {  /// Anything over 0.5 seems to work
                self.focusedField = .field
            }
        }
    }
}

extension Color {
    static let lightShadow = Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
    static let darkShadow = Color(red: 163 / 255, green: 177 / 255, blue: 198 / 255)
    static let background = Color(red: 7, green: 6, blue: 6)
    static let neumorphictextColor = Color(red: 132 / 255, green: 132 / 255, blue: 132 / 255)
}


//    static let background = Color(red: 224 / 255, green: 229 / 255, blue: 236 / 255)
