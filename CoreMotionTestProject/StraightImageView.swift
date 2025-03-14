//
//  StraightImageView.swift
//  CoreMotionTestProject
//
//  Created by Niloufar Rabiee on 10/03/25.
//

import SwiftUI

struct StraightImageView: View {
    @StateObject var motion: MotionManager = MotionManager()

    var body: some View {
        ZStack {
            Image(systemName: "heart.fill")
                .foregroundColor(.white)
                .font(.system(size: 120))
                .frame(width: 300, height: 300)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.red, lineWidth: 4)
                )
                .rotationEffect(.init(radians: atan2(motion.dx, motion.dy) + .pi))

        }
    }
}

#Preview {
    StraightImageView()
}
