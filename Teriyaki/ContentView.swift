//
//  ContentView.swift
//  Teriyaki
//
//  Created by dazn311 on 23.01.2023.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {

        TabView {
            HomePage()
                .tabItem {
                    Label("Home", systemImage: "menucard")
                }

            SearchPageView()
                .tabItem {
                    Label("Search", systemImage: "list.bullet.circle")
                }
        }
    }
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


struct ContentView_Previews: PreviewProvider {
    static let categoriesVM : CategoryesHomeModel = {
       let categoriesVM = CategoryesHomeModel()
        categoriesVM.dataCategories = prevDataCategories
        return categoriesVM
    }()
    static var previews: some View {
        ContentView()
            .environmentObject(categoriesVM)
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext) 
    }
}


//    @Environment(\.managedObjectContext) private var viewContext

//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>
