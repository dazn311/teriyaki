//
//  Persistence.swift
//  Teriyaki
//
//  Created by dazn311 on 23.01.2023.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for _ in 0..<10 {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
        }
//        for cuisine in ["Korea", "Japan", "China"] {
//            let cat23 = CatLevelEntity(context: viewContext)
//            cat23.categoryID = "70"
//            cat23.sortOrder = "0"
//            cat23.name = cuisine
//        }
        for cuisine in [Category(name: "Korea", sortOrder: "0", categoryID: "70"), Category(name: "Japan", sortOrder: "1", categoryID: "67"), Category(name: "China", sortOrder: "2", categoryID: "77")].sorted(by: { $0.sortOrder > $1.sortOrder}) {
            let cat23 = CatLevelEntity(context: viewContext)
            cat23.categoryID = "70"
            cat23.sortOrder = "0"
            cat23.name = cuisine.name
        }
        let version23 = VersionDataEntity(context: viewContext)
        version23.apiCategory = "4"
        version23.apiProducts = "4"
        
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Teriyaki")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    func save() {
        let viewContext = container.viewContext
        
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("[64] PersistenceController-save, Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
