//
//  CirclesView.swift
//  CoreMotionTestProject
//
//  Created by Niloufar Rabiee on 10/03/25.
//

import SwiftUI

struct CirclesView: View {
    @StateObject var motion: MotionManager = MotionManager()

    var body: some View {
        ZStack {
            Circle()
                .fill(Color.red)
                .frame(width: 300, height: 300)
                .offset(x: 0, y: motion.fy * 200)
                .blendMode(.screen)

            Circle()
                .fill(Color.green)
                .frame(width: 300, height: 300)
                .offset(x: motion.fy * 200, y: motion.fy * -200)
                .blendMode(.screen)

            Circle()
                .fill(Color.blue)
                .frame(width: 300, height: 300)
                .offset(x: motion.fy * -200, y: motion.fy * -200)
                .blendMode(.screen)
        }
        .animation(.linear)
    }
}

#Preview {
    CirclesView()
}
