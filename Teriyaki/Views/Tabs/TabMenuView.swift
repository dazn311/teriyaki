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
                    Label("Home", systemImage: "menucard")
                }
                .id(1)
//                .badge(2)

            SearchPageView()
                .tabItem {
                    Label("Search", systemImage: "list.bullet.circle")
                }
                .id(2)
            CartPageView(filter: "parentID")
                .tabItem {
                    Label("Cart", systemImage: "bag")
                }
                .id(3)
            FavoritePageView(filter: "parentID")
                .tabItem {
                    Label("Fav", systemImage: "heart.circle")
                }
                .id(4)
        }
    }
}

struct TabMenuView_Previews: PreviewProvider {
    static var previews: some View {
        TabMenuView()
    }
}
