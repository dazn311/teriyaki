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
    
    public var category: String {
        if let cat2 = apiCategory {
            return String(cat2)
        }else {
            return "2"
        }
    }
    
    public var product: String {
        if let prd2 = apiProducts {
            return String(prd2)
        }else {
            return "2"
        }
    }

}

extension VersionDataEntity : Identifiable {

}
