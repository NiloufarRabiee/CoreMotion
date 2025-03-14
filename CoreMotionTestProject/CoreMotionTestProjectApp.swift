//
//  CoreMotionTestProjectApp.swift
//  CoreMotionTestProject
//
//  Created by Niloufar Rabiee on 10/03/25.
//

import SwiftUI

@main
struct CoreMotionTestProjectApp: App {
    
    @StateObject var motionManager: MotionManager = MotionManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(motionManager)
        }
    }
}
