//
//  GameView.swift
//  Set
//
//  Created by Edward Phan on 2022-01-26.
//

import SwiftUI

struct GameView: View {
    
    @ObservedObject var game: SetGameViewModel
    
    private let layouts = [
        GridItem(.adaptive(minimum: 80)),
        GridItem(.adaptive(minimum: 80)),
        GridItem(.adaptive(minimum: 80)),
        GridItem(.adaptive(minimum: 80))
    ]
    
    var body: some View {
        ZStack {
            // MARK: Background
            LinearGradient(gradient: Gradient(colors: [.white, Color.gray.opacity(0.1)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                ScrollView {
                    LazyVGrid(columns: layouts) {
                        ForEach(game.model.cards) { card in
                            CardView(card: card)
                        }
                    }
                }
                Spacer()
                HStack {
                    Button {
                        print("new game")
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 50)
                            Text("New Game")
                                .bold()
                                .foregroundColor(.white)
                        }
                    }
                    Button {
                        print("3 more cards")
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 50)
                            Text("Deal 3 More Cards")
                                .bold()
                                .foregroundColor(.white)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(game: SetGameViewModel())
.previewInterfaceOrientation(.portrait)
    }
}
