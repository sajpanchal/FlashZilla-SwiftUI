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
            .onReceive(timer) { time in
                if self.counter == 5 {
                    self.timer.upstream.connect().cancel()
                }
                else {
                    print("The time is now \(time)")
                }
                self.counter += 1
                
            }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
