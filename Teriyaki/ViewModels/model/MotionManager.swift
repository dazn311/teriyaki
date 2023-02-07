//
//  MotionManager.swift
//  Teriyaki
//
//  Created by dazn311 on 02.02.2023.
//

import Foundation
import CoreMotion

class MotionManager: ObservableObject {
    private let motionManager = CMMotionManager()
    @Published var x = 0.0
    @Published var y = 0.0
    
    init() {
        motionManager.deviceMotionUpdateInterval = 1/16
        motionManager.startDeviceMotionUpdates(to: .main) { [weak self] data, error in
            guard let motion = data?.attitude else {return}
            self?.x = motion.roll
            self?.y = motion.pitch
        }
    }
    
}
