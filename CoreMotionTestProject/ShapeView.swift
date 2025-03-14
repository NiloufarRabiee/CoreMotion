//
//  ShapeView.swift
//  CoreMotionTestProject
//
//  Created by Niloufar Rabiee on 10/03/25.
//

import SwiftUI

struct ShapeView: Shape {
    
    let bezier: UIBezierPath

    func path(in rect: CGRect) -> Path {
        let path = Path(bezier.cgPath)
        let multiplier = min(rect.width, rect.height)
        let transform = CGAffineTransform(scaleX: multiplier, y: multiplier)
        return path.applying(transform)
    }
}


