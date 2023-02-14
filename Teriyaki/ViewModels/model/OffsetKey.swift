//
//  OffsetKey.swift
//  Teriyaki
//
//  Created by dazn311 on 09.02.2023.
//

import SwiftUI

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGRect = .zero
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}

