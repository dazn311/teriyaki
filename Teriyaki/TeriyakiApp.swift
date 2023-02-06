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
    
    @Environment(\.scenePhase) var ScenePhase
    
    @StateObject var prdVM = ProductsListViewModel()
    @StateObject var catsVM = CategoriesListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(prdVM)
                .environmentObject(catsVM)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: ScenePhase) { phase in
            print(phase) //background, inactive, active
            
            if phase == .background {
                persistenceController.save()
            }
        }
    }
}
