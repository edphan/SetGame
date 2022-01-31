//
//  SetGameViewModel.swift
//  Set
//
//  Created by Edward Phan on 2022-01-27.
//

import Foundation
import SwiftUI

class SetGameViewModel: ObservableObject {
    static let numbers = [1, 2, 3]
    static let colors = [Color.blue, Color.red, Color.green]

    static func startSetGame() -> SetGameModel {
        var cards: [Card] = []
        for num in numbers {
            for color in colors {
                for shape in CardShapes.allCases {
                    for shading in CardShadings.allCases {
                        cards.append(Card(id: UUID(), numberOfShapes: num, color: color, shape: shape, shading: shading))
                    }
                }
            }
        }
        return SetGameModel(cards: cards)
    }
    
    @Published var model: SetGameModel
    
    init() {
        model = SetGameViewModel.startSetGame()
    }
    
    // MARK: - Intent Functions
    
    // Begins the game
    
    // Add 3 more cards
    
    // User selects a card
    func selectACard(selectedCard: Card) {
        model.selectACard(card: selectedCard)
    }
    // Check to see if the selected cards matched
}
