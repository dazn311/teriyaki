//
//  BtnPay.swift
//  Teriyaki
//
//  Created by dazn311 on 02.02.2023.
//

import SwiftUI

struct BtnPay: View {
    var price = "0"
    
    var body: some View {
        HStack {
            Button {
//                                         parentId = catObj.category_id
//                 print(catObj.categoryID)
            } label: {
                Text(transformPrice(price: price))
                    .badge(3)
                    .foregroundColor(Color(red: 255 / 255, green: 225 / 255, blue: 189 / 255)) // If you have this
                    .frame(maxHeight: 30)
                    .padding(.horizontal,16)
                    .padding(.vertical, 2)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.white, lineWidth: 1))

            }
            .cornerRadius(4)         // You also need th
            .overlay(alignment: .topTrailing) {
                Text("3")
                    .fixedSize(horizontal: true, vertical: false)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Color.white)
                    .padding(.horizontal, 6)
                    .padding(.vertical, 2)
                    .background(
                        Capsule()
                            .fill(Color.red)
                            .aspectRatio(1, contentMode: .fill)
                    )
                    .offset(x: 5, y: -10)
            }
            
            Spacer()
        }
        .frame(minHeight: 50, maxHeight: 50, alignment: .leading)
        .padding(.horizontal,10)
        .padding(.bottom,4)
    }
}

struct BtnPay_Previews: PreviewProvider {
    static var previews: some View {
        BtnPay()
    }
}
