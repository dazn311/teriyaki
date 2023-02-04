//
//  ContentView.swift
//  Teriyaki
//
//  Created by dazn311 on 23.01.2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest var fetchRequestCatLevel: FetchedResults<CatLevelEntity>
    @FetchRequest var fetchRequestVersion: FetchedResults<VersionDataEntity>
    
    @EnvironmentObject var catsVM: CategoriesListViewModel
//    @State private var isCatData: Bool = false
    
    init() {
        _fetchRequestCatLevel = FetchRequest<CatLevelEntity>(sortDescriptors: [SortDescriptor(\.sortOrder)], predicate: nil)
        _fetchRequestVersion = FetchRequest<VersionDataEntity>(sortDescriptors: [SortDescriptor(\.apiCategory)], predicate: nil)

    }
    
    var body: some View {
        TabMenuView()
            .onAppear {
                if isCatDataInCore() {
                    setDataToCatVM()
                } else {
                    catsVM.fetchCats(for: "/catstoplevel", version: 3) {ver2 in
//                        print("fetchCats version: \(ver2)")
                        if isExist(fetchVersion: ver2) {
//                            print("good save")
                            setDataToCatCore()
                        }
                    }
                }
            }
    }
    
    private func isCatDataInCore() -> Bool {
        print("CatData In Core count: \(fetchRequestCatLevel.count)")
   
        if fetchRequestCatLevel.count > 0 {
            return true
        } else {
            return false
        }
    }
    
    private func isExist(fetchVersion: Int) -> Bool {
//        print("CatLevel in Core: \(fetchRequestCatLevel.count)")
    //set versions;
        var versionCatInCore = 0
        for ver in fetchRequestVersion {
//            print("Cat in Core version: \(ver.category)")
            if versionCatInCore < ver.category {
                versionCatInCore = ver.category
            }
        }
//        print("Version in Core:\(versionCatInCore), count: \(fetchRequestVersion.count)")
        if versionCatInCore < fetchVersion {
            let v2 = VersionDataEntity(context: viewContext)
            v2.apiCategory = String(fetchVersion)
            v2.apiProducts = "0"
            
            do {
                try viewContext.save()
                print("moc save: v2.apiCategory: \(fetchVersion)")
            } catch {
                let nsError = error as NSError
                print("91-error: \(nsError)")
            }
            return true
        }
        return true
    }
    
    private func setDataToCatCore() {
        catsVM.data.forEach { cat in
            let c2 = CatLevelEntity(context: viewContext)
            c2.name = cat.name
            c2.categoryID = cat.categoryID
            c2.sortOrder = cat.sortOrder
            
            do {
                try viewContext.save()
//                print("moc save from catsVM.data")
            } catch {
                let nsError = error as NSError
                print("110-error: \(nsError)")
            }
        }
        
    }
    
    private func setDataToCatVM() {
        var array: [Category] = []
        for c2 in fetchRequestCatLevel {
            array.append(Category(name: c2.name, sortOrder: c2.sortOrder, categoryID: c2.categoryID))
        }
        catsVM.data = array
        catsVM.state = .fetched
//        print("[46] set to catsVM.data")
    }
//        return res.count > 0 ? true : false
}

//extension UIApplication {
//    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
//        if let navigationController = controller as? UINavigationController {
//            return topViewController(controller: navigationController.visibleViewController)
//        }
//        if let tabController = controller as? UITabBarController {
//            if let selected = tabController.selectedViewController {
//                return topViewController(controller: selected)
//            }
//        }
//        if let presented = controller?.presentedViewController {
//            return topViewController(controller: presented)
//        }
//        return controller
//    }
//}


//struct ContentView_Previews: PreviewProvider {
//    static let categoriesVM : CategoryesHomeModel = {
//       let categoriesVM = CategoryesHomeModel()
//        categoriesVM.dataCategories = prevDataCategories
//        return categoriesVM
//    }()
//    static var previews: some View {
//        ContentView()
//            .environmentObject(categoriesVM)
//            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}


//    @Environment(\.managedObjectContext) private var viewContext

//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>


//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "VersionDataEntity")
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "VersionDataEntity", sortDescriptors: [SortDescriptor(\.apiCategory)], predicate: true)
//        fetchRequest.predicate = NSPredicate(format: "productID = %d", argumentArray: [productID])

//        let res = try! moc.fetch(fetchRequest)
//        print("108 res.count: \(res.count)")

