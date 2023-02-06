//
//  VersionDataEntity+CoreDataProperties.swift
//  Teriyaki
//
//  Created by dazn311 on 03.02.2023.
//
//

import Foundation
import CoreData


extension VersionDataEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<VersionDataEntity> {
        return NSFetchRequest<VersionDataEntity>(entityName: "VersionDataEntity")
    }

    @NSManaged public var apiCategory: String?
    @NSManaged public var apiProducts: String?
    
    public var category: Int {
        if let cat2 = apiCategory {
            return Int(cat2)!
        }else {
            return 2
        }
    }
    
    public var product: Int {
        if let prd2 = apiProducts {
            return Int(prd2)!
        }else {
            return 2
        }
    }
    
    static func delete(at offset: IndexSet, for items: [VersionDataEntity]) {
        if let first = items.first, let viewContext = first.managedObjectContext {
            offset.map{ items[$0] }.forEach { data in
                viewContext.delete(data)
            }
        }
    }
    
    static func deleteAll(for items: [VersionDataEntity]) {
        if let first = items.first, let viewContext = first.managedObjectContext {
            for ver2 in items {
              viewContext.delete(ver2)
            }
        }
    }

}

extension VersionDataEntity : Identifiable {

}
