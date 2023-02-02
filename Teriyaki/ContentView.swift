//
//  ContentView.swift
//  Teriyaki
//
//  Created by dazn311 on 23.01.2023.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {

        TabView {
            HomePage()
                .tabItem {
                    Label("Home", systemImage: "menucard")
                }

            SearchPageView()
                .tabItem {
                    Label("Search", systemImage: "list.bullet.circle")
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static let categoriesVM : CategoryesHomeModel = {
       let categoriesVM = CategoryesHomeModel()
        categoriesVM.dataCategories = prevDataCategories
        return categoriesVM
    }()
    static var previews: some View {
        ContentView()
            .environmentObject(categoriesVM)
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext) 
    }
}


//    @Environment(\.managedObjectContext) private var viewContext

//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>
