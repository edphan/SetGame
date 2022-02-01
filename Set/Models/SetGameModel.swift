//
//  SetGameModel.swift
//  Set
//
//  Created by Edward Phan on 2022-01-27.
//

// Handles all the logic of the game
// Such as:
// - checks whether or not the cards matched
// - stores an array of all variants of card
import Foundation
import SwiftUI

struct SetGameModel {
    private(set) var cards: [Card]
    private(set) var selectedCards: [Card] = []
    
    mutating func selectACard(card: Card) {
        guard let choosenIndex = cards.firstIndex(where: { $0.id == card.id }) else {
            return
        }
        cards[choosenIndex].isSelected.toggle()
        
        // add all card with isSelected == true to selectedCards array
        selectedCards = cards.filter({ card in
            card.isSelected == true
        })
        
        // check if there are 3 cards in the selectedCards array
        // if there are, call the check function then remove all cards from the selectedCards array
            // because those 3 are either matched not not matched, in both cases we need to reset the array
        // else, don't remove any card from the selectedCards array
        if selectedCards.count == 3 {
            
            // If matched, remove the cards from cards array
            if checkMatchCards(selectedCards) {
                // remove the cards from cards array
                for card in selectedCards {
                    cards.removeAll { cardToRemove in
                        cardToRemove.id == card.id
                    }
                }
            } else {
                // Else the 3 cards do not matched => turn .isSelected to false
                for card in selectedCards {
                    guard let index = cards.firstIndex(where: { $0.id == card.id }) else {
                        return
                    }
                    cards[index].isSelected = false
                }
            }
            // remove all cards in the selectedCards array to start over
            selectedCards.removeAll()
        }
    }
    
    // Check if the 3 selected cards matched
    func checkMatchCards(_ cardsToCheck: [Card]) -> Bool {
        let colorFeature = cardsToCheck[0].color
        let numberOfShapeFeature = cardsToCheck[0].numberOfShapes
        let shapeFeature = cardsToCheck[0].shape
        let shadingFeature = cardsToCheck[0].shading
        
        if !((colorFeature == cardsToCheck[1].color) == (colorFeature == cardsToCheck[2].color)) {
            return false
        }
        if !((numberOfShapeFeature == cardsToCheck[1].numberOfShapes) == (numberOfShapeFeature == cardsToCheck[2].numberOfShapes)) {
            return false
        }
        if !((shapeFeature == cardsToCheck[1].shape) == (shapeFeature == cardsToCheck[2].shape)) {
            return false
        }
        if !((shadingFeature == cardsToCheck[1].shading) == (shadingFeature == cardsToCheck[2].shading)) {
            return false
        }
        return true
    }
}
