//
//  Logo.swift
//  Teriyaki
//
//  Created by dazn311 on 02.02.2023.
//

import SwiftUI

struct Logo: View {
    @Binding var flag: Bool
    @StateObject private var motion = MotionManager()
    
    private let heightLogo = CGFloat(36)
    
    var body: some View {
            withAnimation(.spring()) {
                Image("logo22")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: flag == false ? heightLogo : 0, height: flag == false ? heightLogo : 0)
                    .clipShape(Circle())
                    .offset(x: 0, y: motion.y * (-10))
                    .shadow(color: .gray.opacity(0.3), radius: 5, x: motion.x * 5, y:  motion.y * 5 - 5)
//                    .foregroundStyle(
//                        .red.shadow(color: .black, radius: 10, x: motion.x * 10, y:  motion.y * 10)
//                        .shadow(color: .black.opacity(0.2), radius: 10, x: motion.x * 10, y:  motion.y * 10)
//                    )
            }
//            .rotation3DEffect(.degrees(motion.x ), axis: (x: 0, y: 1, z: 0))
//            .rotation3DEffect(.degrees(motion.y ), axis: (x: -1, y: 0, z: 0))
    }
}

//struct Logo_Previews: PreviewProvider {
//    static var previews: some View {
//        Logo()
//    }
//}
