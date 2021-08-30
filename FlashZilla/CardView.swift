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
    var removal: (() -> Void)? = nil
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.white)
                .shadow(radius: 10)
            VStack {
                Text(card.prompt)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                if isShowingAnswer {
                Text(card.answer)
                    .font(.title)
                    .foregroundColor(.gray)
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
                }
                .onEnded { _ in
                    if abs(self.offset.width) > 100 {
                        self.removal?()
                    }
                    else {
                        self.offset = .zero
                    }
                }
        )
        .onTapGesture {
            isShowingAnswer.toggle()
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.example)
    }
}
