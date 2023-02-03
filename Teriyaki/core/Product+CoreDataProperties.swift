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
    
    public var wrappedName: String {
        if let nm = name {
            return String(nm)
        }else {
            return "**"
        }
        
    }
    public var url: String {
        if let url2 = thumb {
            return String(url2)
        }else {
            return "https//teriyaki.su"
        }
    }
    public var _thumb: String {
        url;
    }
    public var wrappedDescription: String {
        if let desc = description2 {
            return String(desc.split(separator: ".").first ?? "")
        }else {
            return ""
        }
        
    }
    
    public var wrappedDescriptionKg: String {
        if let desc = description2 {
            return String(desc.split(separator: ".").last ?? "")
        }else {
            return ""
        }
        
    }
    
    public var wrapPrice: String {
//        let set = price != nil ? String(price!.dropLast()) : "0p"
        let set = price != nil ? String(price!) : "0p"
        
        return set
    }
    
//    var wrappedDescriptionKg: String {
//        "\(String(describing: (description2 != nil) ? description2!.split(separator: ".").last : "0 g") )"
//    }
}

extension Product : Identifiable {

}
