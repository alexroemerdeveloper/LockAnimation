//
//  ContentView.swift
//  lockAnimation
//
//  Created by Alexander Römer on 23.03.20.
//  Copyright © 2020 Alexander Römer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tilted = false
    @State private var locked = false

    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 64, height: 64)
                .cornerRadius(6)
                .foregroundColor(Color(.darkGray))
            
            Capsule()
                .trim(from: locked ? 0 : 3/5, to: 1)
                .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                .frame(width: 44, height: 44)
                .foregroundColor(Color(.darkGray))
                .offset(y: -30)
                .animation(Animation.timingCurve(0.68, -0.6, 0.32, 1.6).delay(0.5).repeatCount(1, autoreverses: true))
                .onAppear() {
                    self.locked.toggle()
                }
        }
        .rotationEffect(.degrees(tilted ? 0 : 30))
        .animation(Animation.timingCurve(0.68, -0.6, 0.32, 1.6).delay(0.5).repeatCount(1, autoreverses: true))
        .onAppear() {
            self.tilted.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
