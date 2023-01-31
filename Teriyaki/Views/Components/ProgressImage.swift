//
//  ProgressImage.swift
//  Teriyaki
//
//  Created by dazn311 on 27.01.2023.
//

import SwiftUI

struct ProgressImage: View {
    var body: some View {
            ZStack {
                Image("logo2")
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .aspectRatio(1.5,contentMode: .fill)
                    .blur(radius: 3)
                    
                ProgressView()
                    .tint(.white)
                    .scaleEffect(1.5, anchor: .center)
                    .foregroundColor(Color.green)
            }
    }
}

struct ProgressImage_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            ProgressImage()
        }
        .frame(width: 200, height: 200)
        
    }
}
