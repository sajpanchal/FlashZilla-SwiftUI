//
//  ContentView.swift
//  FlashZilla
//
//  Created by saj panchal on 2021-08-28.
//

import SwiftUI
import CoreHaptics

struct ContentView: View {
    @State var offset = CGSize.zero
    @State var isDragging = false
    @State var engine: CHHapticEngine?
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    @State var scale: CGFloat = 1
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var counter = 0
    var body: some View {
        Text("Hello, World!")
            .padding()
            .background(reduceTransparency ? Color.white : Color.white.opacity(0.5))
            .foregroundColor(Color.black)
            .clipShape(Capsule())
    }
    func withOptionalAnimation<Result> (_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
        if UIAccessibility.isReduceMotionEnabled {
            return try body()
        }
        else {
            return try withAnimation(animation, body)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
