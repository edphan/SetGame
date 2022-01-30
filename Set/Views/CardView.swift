//
//  CardView.swift
//  Set
//
//  Created by Edward Phan on 2022-01-26.
//

import SwiftUI

struct CardView: View {
    
    let card: Card
    
    var opacity: Double {
        switch card.shading {
        case .open: return 0.0
        case .transparent: return 0.2
        case .solid: return 1
        }
    }
    
    func shape(_ shape: CardShapes) -> some Shape {
        switch shape {
        case .rectangle: return CustomShape(Rectangle())
        case .diamond: return CustomShape(Diamond())
        case .circle: return CustomShape(Circle())
        }
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .opacity(0)
                
            VStack {
                ForEach(0..<card.numberOfShapes, id: \.self) { _ in
                    ZStack {
                        shape(card.shape).opacity(self.opacity)
                        shape(card.shape)
                            .stroke(lineWidth: 5)
                    }
                    .aspectRatio(1, contentMode: .fit)
                    .padding(.vertical)
                }
            }
            .foregroundColor(card.color)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card(id: UUID(), numberOfShapes: 3, color: Color.blue, shape: .diamond, shading: .transparent))
    }
}
