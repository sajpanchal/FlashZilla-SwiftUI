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
