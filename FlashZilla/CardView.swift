//
//  CardView.swift
//  FlashZilla
//
//  Created by saj panchal on 2021-08-30.
//

import SwiftUI

struct CardView: View {
    let card: Card
    @State var isShowingAnswer = false
    @State var offset = CGSize.zero
    @EnvironmentObject var result: Result
    @State var feedback = UINotificationFeedbackGenerator()
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityEnabled) var accessibilityEnabled
    var removal: ((Bool) -> Void)? = nil
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(differentiateWithoutColor ? Color.white : Color.white
                        .opacity(1 - Double(abs(offset.width/50))))
                .background(differentiateWithoutColor ? nil : RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .fill(offset.width > 0 ? Color.green : Color.red))
                .shadow(radius: 10)
            VStack {
                if accessibilityEnabled {
                    Text(isShowingAnswer ? card.answer : card.prompt)
                        .font(.largeTitle)
                        .foregroundColor(.black)
                }
                else {
                    Text(card.prompt)
                        .font(.largeTitle)
                        .foregroundColor(.black)
                    if isShowingAnswer {
                        Text(card.answer)
                            .font(.title)
                            .foregroundColor(.gray)
                    }
                }                                    
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width: 450, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .rotationEffect(.degrees(Double(offset.width/5)))
        .offset(x: offset.width*5, y: 0)
        .opacity(2 - Double(abs(offset.width/50)))
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    self.offset = gesture.translation
                    self.feedback.prepare()
                }
                .onEnded { _ in
                     if abs(self.offset.width) > 100 {
                         if self.offset.width > 0 {
                            self.feedback.notificationOccurred(.success)
                            result.isPassed = true
                         }
                         else {
                            self.feedback.notificationOccurred(.error)
                            result.isPassed = false
                     }
                        self.removal?(result.isPassed)
                    }
                    else {
                        self.offset = .zero
                    }
                    
                }
        )
        .onTapGesture {
            isShowingAnswer.toggle()
        }
        .animation(.spring())
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.example)
    }
}
