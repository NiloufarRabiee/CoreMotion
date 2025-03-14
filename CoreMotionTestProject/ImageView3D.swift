//
//  ImageView3D.swift
//  CoreMotionTestProject
//
//  Created by Niloufar Rabiee on 10/03/25.
//

import SwiftUI

struct ImageView3D: View {
    @StateObject var motion: MotionManager = MotionManager()

    var body: some View {
        ZStack {
            Image(systemName: "heart.fill")
                .foregroundColor(.red)
                .font(.system(size: 120))
                .frame(width: 300, height: 300)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.white, lineWidth: 4)
                )
                .rotation3DEffect(.init(radians: .pi), axis: (motion.fx, motion.fy, motion.fz + 0.5))
        }
    }
}

