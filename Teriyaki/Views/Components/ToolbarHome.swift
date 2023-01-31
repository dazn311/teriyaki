//
//  ToolbarHome.swift
//  Teriyaki
//
//  Created by dazn311 on 25.01.2023.
//

import SwiftUI
//
//struct FocusedPost: FocusedValueKey {
//    typealias Value = Binding<Bool>
//}
//
//enum FocusedField {
//        case firstName, lastName
//    }

struct ToolbarHome: View {
    @EnvironmentObject var categoriesVM : CategoryesHomeModel
    @EnvironmentObject var viewModel : CategoriesListViewModel
    
    @Binding var flag: Bool
    @Binding var searchText: String
    
//    @FocusState var showKeyBoard: Bool
    
    var body: some View {
        VStack{
            HStack {
                Group {
                    switch viewModel.state {
                        case .fetched:
                            VStack {
                                MenuCuisine(parentId: $categoriesVM.parentId)
                                    .environmentObject(viewModel)
                            }
                            .padding(.vertical,4)
                        case .initional:
                            Text("init")
                                .onAppear {
                                    viewModel.fetchCats(for: "/catstoplevel")
                                }
                        case .fetching:
                            Text("fetching...")
                        case .error(_):
                            Text("all")
                            .foregroundColor(Color.pink)
                    }
                }
                .frame(minWidth: 100, idealWidth: 100, maxWidth: 100, minHeight: 50, idealHeight: 50, maxHeight: 50, alignment: .center)
                
                Spacer()
                    .frame(width: flag == false ?(UIScreen.main.bounds.size.width / 2) - 140 : 2)

                let heightLogo = CGFloat(36)
                    withAnimation(.spring()) {
                        Image("logo22")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: flag == false ? heightLogo : 0, height: flag == false ? heightLogo : 0)
                            .clipShape(Circle())
                            .offset(x: 0, y: -10)
                    }

                  if flag {
                      SearchBar(searchText: $searchText, flag: $flag)
                      .frame(maxWidth: .infinity, maxHeight: .infinity)

                  } else {
                    Spacer()
                      .frame(minWidth: 10)

                    Button {
                        withAnimation(.spring()) {
                            flag = true }
                    } label: {
                      Image(systemName: "text.magnifyingglass")
                            .foregroundColor(Color.gray)
                    }

                    Button {
                        callNumber(phoneNumber: "+74950980409")
                    } label: {
                      Image(systemName: "phone.connection")
                            .foregroundColor(Color.gray)
                    }

                  }
            
            }
            
        }
    }//end body
    
    private func callNumber(phoneNumber: String) {
        guard let url = URL(string: "telprompt://\(phoneNumber)"),
            UIApplication.shared.canOpenURL(url) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
}

struct ToolbarHome_Previews: PreviewProvider {
    @State static var flag = false
    @State static var searchText = ""
    
    static var previews: some View {
        ToolbarHome(flag: $flag, searchText: $searchText)
    }
}
