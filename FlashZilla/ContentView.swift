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
    
    var body: some View {
        Text("Hello World")
            .onAppear {
                prepareHaptics()
            }
            .onTapGesture {
                complexSuccess()
            }
    }
    
    func simpleSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.error)
    }
    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {
            return
        }
        do {
            self.engine = try CHHapticEngine()
            try engine?.start()
        }
        catch {
            print(error.localizedDescription)
        }
    }
    func complexSuccess() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {
            return
        }
        var events = [CHHapticEvent]()
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1)
        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
        events.append(event)
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        }
        catch {
            print("not supported....",error.localizedDescription)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
