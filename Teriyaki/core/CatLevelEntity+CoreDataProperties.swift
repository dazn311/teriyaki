//
//  CatLevelEntity+CoreDataProperties.swift
//  Teriyaki
//
//  Created by dazn311 on 03.02.2023.
//
//

import Foundation
import CoreData


extension CatLevelEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CatLevelEntity> {
        let request = NSFetchRequest<CatLevelEntity>(entityName: "CatLevelEntity")
        request.sortDescriptors = [NSSortDescriptor(key: "sordOrder", ascending: false)]
        request.predicate = NSPredicate(format: "TRUEPREDICATE")
        return request
//        return NSFetchRequest<CatLevelEntity>(entityName: "CatLevelEntity")
    }

    @NSManaged public var categoryID: String
    @NSManaged public var name: String
    @NSManaged public var sortOrder: String
    
//    public override func awakeFromInsert() {
//        setPrimitiveValue("prim_val", forKey: "name")
//        setPrimitiveValue("70", forKey: "70")
//    }
    
    var sort_order: String {
        get {
            sortOrder
        }
        set {
            sortOrder = newValue
        }
    }
    
    var category_id: String {
        get {
            categoryID
        }
        set {
            categoryID = newValue
        }
    }

    static func delete(at offset: IndexSet, for items: [CatLevelEntity]) {
        if let first = items.first, let viewContext = first.managedObjectContext {
            offset.map{ items[$0] }.forEach { data in
                viewContext.delete(data)
            }
        }
    }
    
    static func deleteAll(for items: [CatLevelEntity]) {
        if let first = items.first, let viewContext = first.managedObjectContext {
            for ver2 in items {
              viewContext.delete(ver2)
            }
        }
    }
    
//    static func fetch() -> NSFetchRequest<CatLevelEntity> {
//        let request = NSFetchRequest<CatLevelEntity>(entityName: "CatLevelEntity")
//        request.sortDescriptors
//    }
    
}

extension CatLevelEntity : Identifiable {

}
