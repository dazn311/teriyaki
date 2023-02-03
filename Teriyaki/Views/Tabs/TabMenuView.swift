//
//  TabMenuView.swift
//  Teriyaki
//
//  Created by dazn311 on 03.02.2023.
//

import SwiftUI

struct TabMenuView: View {
    var body: some View {
        TabView {
            HomePage()
                .tabItem {
                    Label("Меню", systemImage: "menucard")
                }
                .id(1)
//                .badge(2)

            SearchPageView()
                .tabItem {
                    Label("Поиск", systemImage: "list.bullet.circle")
                }
                .id(2)
            CartPageView(filter: "parentID")
                .tabItem {
                    Label("Корзина", systemImage: "bag")
                }
                .id(3)
            FavoritePageView(filter: "parentID")
                .tabItem {
                    Label("Избранные", systemImage: "heart.circle")
                }
                .id(4)
            SettingPageView()
                .tabItem {
                    Label("Настройки", systemImage: "digitalcrown.arrow.clockwise")
                }
                .id(5)
        }
    }
}

struct TabMenuView_Previews: PreviewProvider {
    static var previews: some View {
        TabMenuView()
    }
}
