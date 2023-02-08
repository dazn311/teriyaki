//
//  TabMenuView.swift
//  Teriyaki
//
//  Created by dazn311 on 03.02.2023.
//

import SwiftUI

struct TabMenuView: View {
    let appearance: UITabBarAppearance = UITabBarAppearance()
    @EnvironmentObject var cartVM : CartViewModel
    
    @StateObject var tabStateManager: TabStateManager = TabStateManager()
    @State private var shouldShowMenu = true
    init() {
        UITabBar.appearance().scrollEdgeAppearance = appearance
        UITabBar.appearance().backgroundColor = .black
    }
    var body: some View {
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            TabView {
                HomePage()
                    .tabItem {
                        Label("Меню", systemImage: "menucard")
                    }
                    .id(1)
                    .badge(0)

                SearchPageView()
                    .tabItem {
                        Label("Поиск", systemImage: "list.bullet.circle")
                    }
                    .id(2)
                CartPageView()
                    .tabItem {
                        Label("Корзина", systemImage: "bag")
                    }
                    .id(3)
                    .badge(cartVM.countPrd)
                FavoritePageView(filter: "parentID")
                    .tabItem {
                        Label("Избранные", systemImage: "heart.circle")
                    }
                    .id(4)
                    .badge(2)
                SettingPageView()
                    .tabItem {
                        Label("Настройки", systemImage: "digitalcrown.arrow.clockwise")
                    }
                    .id(5)
            }
            .environmentObject(tabStateManager)
        } else {
            NavigationView {
                List {
                    NavigationLink("Меню", destination: HomePage(), isActive: $shouldShowMenu)
                    NavigationLink("Поиск", destination: SearchPageView())
                    NavigationLink("Корзина", destination: CartPageView())
                    NavigationLink("Избранные", destination: FavoritePageView(filter: "parentID"))
                    NavigationLink("Настройки", destination: SettingPageView())
                    
                }
                .navigationTitle("Teriyaki")
                
                Text("Select a Cuisine") // A placeholder to show before selection.
            }
        }
    }
}

struct TabMenuView_Previews: PreviewProvider {
    static var previews: some View {
        TabMenuView()
    }
}
