//
//  ContentView.swift
//  CoreMotionTestProject
//
//  Created by Niloufar Rabiee on 10/03/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var motion: MotionManager = MotionManager()
    @State var viewType = 0
    
    var body: some View {
        ZStack {
            if viewType == 0 {
                CirclesView()
            } else if viewType == 1 {
                ScalingMaskView()
            } else if viewType == 2 {
                TextMaskView()
            } else if viewType == 3 {
                StraightImageView()
            } else if viewType == 4 {
                ImageView3D()
            } else {
                ShapeView(bezier: .unwrapLogo)
                    .trim(from: 0, to: -motion.fy * 2)
                    .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round, dash: [8, 12], dashPhase: 0))
                    .foregroundColor(.blue)
                    .frame(width: 300, height: 300)
            }
            
        }
        .onTapGesture {
            self.viewType += 1
            
            if self.viewType == 6 {
                self.viewType = 0
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ContentView()
}


/// Motion Manager
import CoreMotion

class MotionManager: ObservableObject {
    private let motionManager = CMMotionManager()
    
    var fx: CGFloat = 0
    var fy: CGFloat = 0
    var fz: CGFloat = 0
    
    var dx: Double = 0
    var dy: Double = 0
    var dz: Double = 0
    
    init() {
        motionManager.startDeviceMotionUpdates(to: .main) { data, error in
            guard let newData = data?.gravity else { return }
            
            self.dx = newData.x
            self.dy = newData.y
            self.dz = newData.z
            
            self.fx = CGFloat(newData.x)
            self.fy = CGFloat(newData.y)
            self.fz = CGFloat(newData.z)
            
            self.objectWillChange.send()
        }
    }
    
    func shutdown() {
        motionManager.stopDeviceMotionUpdates()
    }
}
