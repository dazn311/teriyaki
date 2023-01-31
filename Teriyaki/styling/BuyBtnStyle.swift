//
//  BuyBtnStyle.swift
//  Teriyaki
//
//  Created by dazn311 on 31.01.2023.
//

import SwiftUI

struct BuyBtnStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.accentColor)
            .padding(.vertical, 5)
            .padding(.horizontal, 10)
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.accentColor, lineWidth: 1))
            .opacity(configuration.isPressed ? 0.5: 1)
    }
}

struct BuyBtnStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Button("3 120p") {
                
            }
            .buttonStyle(BuyBtnStyle())
        }
        
    }
}
