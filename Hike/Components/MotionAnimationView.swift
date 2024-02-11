//
//  MotionAnimationView.swift
//  Hike
//
//  Created by Md Ahsan Ullah Rasel on 2024/02/11.
//  Copyright © 2024 TriTree Solutions. All rights reserved.
//

import SwiftUI

struct MotionAnimationView: View {
    // MARK: - PROPETIES
    
    @State private var randomNumber: Int = Int.random(in: 6...12)
    @State private var isAnimating: Bool = false
    
    // MARK: - FUNCTIONS
    
    // 1. RANDOM COORDINATE
    func randomCoordinate() -> CGFloat {
        return CGFloat.random(in: 0...256)
    }
    
    // 2. RANDOM SIZE
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 4...80))
    }
    
    // 3. RANDOM SCALE
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    // 4. RANDOM SPEED
    func randomSpeed() -> Double {
        return Double.random(in: 0.05...1.0)
    }
    
    // 5. RANDOM DELAY
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    
    var body: some View {
        ZStack {
            ForEach(0...randomNumber, id: \.self) { item in
                Circle()
                    .foregroundColor(.white)
                    .opacity(0.25)
                    .frame(width: randomSize())
                    .position(
                        x: randomCoordinate(),
                        y: randomCoordinate()
                    )
                    .scaleEffect(isAnimating ? randomScale() : 1)
                    .onAppear(perform: {
                        withAnimation(
                            .interpolatingSpring(stiffness: 0.25, damping: 0.25)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())
                        ) {
                            isAnimating = true
                        }
                    })
            }
        } //: ZSTACK
        .frame(width: 256, height: 256)
        .mask(Circle())
        .drawingGroup()
    }
}

#Preview {
    MotionAnimationView()
        .background(
            Circle()
                .fill(.teal)
        )
}
