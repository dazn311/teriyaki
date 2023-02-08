//
//  TabStateManager.swift
//  Teriyaki
//
//  Created by dazn311 on 06.02.2023.
//

import Foundation
import Combine

class TabStateManager: ObservableObject {
    @Published var selection: Int = 1
    @Published var currSubCategoryTop: String = "0"
    @Published var currSubCategory: String = "0"
}
