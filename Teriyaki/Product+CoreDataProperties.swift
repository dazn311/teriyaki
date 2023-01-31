//
//  Product+CoreDataProperties.swift
//  Teriyaki
//
//  Created by dazn311 on 27.01.2023.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var description2: String?
    @NSManaged public var href: String?
    @NSManaged public var jan: String?
    @NSManaged public var minimum: String?
    @NSManaged public var model: String?
    @NSManaged public var name: String?
    @NSManaged public var parentID: String?
    @NSManaged public var price: String?
    @NSManaged public var productID: String?
    @NSManaged public var rating: Int16
    @NSManaged public var special: Bool
    @NSManaged public var tax: String?
    @NSManaged public var thumb: String?
    
    public var wrappedDescription: String {
        String(description2!.split(separator: ".").first ?? "")
    }
    
    public var wrappedDescriptionKg: String {
        String(description2!.split(separator: ".").last ?? "")
    }
    
    public var wrapPrice: String {
        let set = price != nil ? String(price!.dropLast()) : "0p"
        
        return set
    }
    
//    var wrappedDescriptionKg: String {
//        "\(String(describing: (description2 != nil) ? description2!.split(separator: ".").last : "0 g") )"
//    }
}

extension Product : Identifiable {

}
