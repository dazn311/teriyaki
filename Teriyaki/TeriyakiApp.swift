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
    @ObservedObject var categoriesVM = CategoryesHomeModel()
    @ObservedObject var viewModel = CategoriesListViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(categoriesVM)
                .environmentObject(viewModel)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
