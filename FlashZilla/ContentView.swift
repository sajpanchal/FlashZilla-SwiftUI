//
//  ContentView.swift
//  FlashZilla
//
//  Created by saj panchal on 2021-08-28.
//

import SwiftUI

struct ContentView: View {
    @State var offset = CGSize.zero
    @State var isDragging = false
    
    var body: some View {
        let dragGesture = DragGesture()
            .onChanged { value in
                self.offset = value.translation
            }
            .onEnded { _ in
                withAnimation {
                    self.offset = .zero
                    self.isDragging = false
                }
            }
        let pressGesture = LongPressGesture()
            .onEnded { value in
                withAnimation {
                    self.isDragging = true
                }
            }
        let combined = pressGesture.sequenced(before: dragGesture)
        return Circle()
            .fill(Color.red)
            .frame(width: 64, height: 64, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .scaleEffect(isDragging ? 1.5 : 1)
            .offset(offset)
            .gesture(combined)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
