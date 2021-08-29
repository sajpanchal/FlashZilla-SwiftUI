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
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var counter = 0
    var body: some View {
        Text("Hello, World!")
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.userDidTakeScreenshotNotification), perform: { _ in
                print("Moving to the background!")
            })
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
