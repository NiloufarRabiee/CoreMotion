//
//  SwiftUIView.swift
//  CoreMotionTestProject
//
//  Created by Niloufar Rabiee on 10/03/25.
//

import SwiftUI

struct ScalingMaskView: View {
    @StateObject var motion: MotionManager = MotionManager()

    var body: some View {
        Image("Lily")
            .resizable()
            .scaledToFit()
            .mask(
                Circle()
                    .scaleEffect(max(0, -motion.fy * 2))
            )
            .foregroundStyle(.white)
    }
}

