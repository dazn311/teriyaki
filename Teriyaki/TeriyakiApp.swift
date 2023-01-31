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

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(categoriesVM)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
