//
//  Extensions.swift
//  Teriyaki
//
//  Created by dazn311 on 06.02.2023.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
