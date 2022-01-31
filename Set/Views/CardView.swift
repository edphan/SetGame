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
            ZStack {
                Rectangle()
                    .stroke(.green, lineWidth: card.isSelected ? 7 : 0)
                Rectangle()
                    .fill(.white)
                .shadow(color: Color.gray.opacity(0.5), radius: 3, x: 1, y: 2)
            }
                
            VStack(spacing: 10) {
                ForEach(0..<card.numberOfShapes, id: \.self) { _ in
                    shape(card.shape)
                        .opacity(self.opacity)
                        .overlay {
                            shape(card.shape)
                                .stroke(lineWidth: 4)
                        }
                        .foregroundColor(card.color)
                        .aspectRatio(1, contentMode: .fit)
                }
            }
            .padding(10)
            .foregroundColor(card.color)
        }
        .aspectRatio(4/7, contentMode: .fit)
        .padding(10)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card(id: UUID(), numberOfShapes: 3, color: Color.blue, shape: .diamond, shading: .transparent, isSelected: true))
            .frame(width: 400, height: 400)
    }
}
