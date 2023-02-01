//
//  TeriyakiApp.swift
//  Teriyaki
//
//  Created by dazn311 on 23.01.2023.
//

import SwiftUI

@main
struct TeriyakiApp: App {
    let persistenceController = PersistenceController.shared
    @ObservedObject var prdVM = ProductsListViewModel()
    @ObservedObject var catsVM = CategoriesListViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(prdVM)
                .environmentObject(catsVM)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
