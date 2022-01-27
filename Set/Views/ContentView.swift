//
//  ContentView.swift
//  Set
//
//  Created by Edward Phan on 2022-01-26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
