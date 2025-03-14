//
//  TextMaskView.swift
//  CoreMotionTestProject
//
//  Created by Niloufar Rabiee on 10/03/25.
//

import SwiftUI

struct TextMaskView: View {
    @StateObject var motion: MotionManager = MotionManager()

    var body: some View {
        Circle()
            .fill(AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center))
            .blur(radius: 20)
            .rotationEffect(.radians((motion.dx + motion.dy) * 2))
            .saturation(motion.dy * -3)
            .mask(
                Text("Hello World")
                    .foregroundColor(.white)
                    .font(.system(size: 96, weight: .black, design: .rounded))
                    .bold()
                    .multilineTextAlignment(.center)
                    .frame(width: 300, height: 300)
            )
    }
}

#Preview {
    TextMaskView()
}
