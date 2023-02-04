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
        return NSFetchRequest<CatLevelEntity>(entityName: "CatLevelEntity")
    }

    @NSManaged public var categoryID: String
    @NSManaged public var name: String
    @NSManaged public var sortOrder: String
    

}

extension CatLevelEntity : Identifiable {

}
