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
    @Published var mayChange: Bool = true
    
    @Published var currSubCategoryTop: String = "0" {
        didSet {
//            print("state currSubCategoryTop change to: \(currSubCategoryTop)")
//            if self.mayChange {
//                mayChange = false
//                blockUpdate()
//            }
        }
    }
    @Published var currSubCategory: String = "0" {
        didSet {
//            print("state bottom change to: \(currSubCategory)")
        }
    }
    @Published var priorySubCategory: String = "bottom" {
        didSet {
//            print("state priorySubCategory change to: \(priorySubCategory)")
        }
    }
    
    func topChange(id: String) {
        if self.currSubCategoryTop != id {
            self.currSubCategoryTop = id
        }
    }
    
    func bottomChange(id: String) {
        if self.currSubCategory != id {
            self.currSubCategory = id
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)) {
                if self.currSubCategoryTop != id {
                    self.currSubCategoryTop = id
                }
            }
        }
    }
    
    func blockUpdate() {
        if self.mayChange == false {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
            print("state blockUpdate:")
            self.mayChange = true
        })
        }
    }
}
