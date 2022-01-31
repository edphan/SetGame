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

struct SetGameModel {
    private(set) var cards: [Card]
    private(set) var selectedCards: [Card] = []
    
    mutating func selectACard(card: Card) {
        guard let choosenIndex = cards.firstIndex(where: { $0.id == card.id }) else {
            return
        }
        cards[choosenIndex].isSelected.toggle()
        // check to see if the selected card is already in the selectedCards array, this is when user unclicks a card
        // if it is, remove it, else append
        if selectedCards.contains(card) == true {
            selectedCards.removeAll { cardToRemove in
                cardToRemove.id == card.id
            }
        } else {
            selectedCards.append(cards[choosenIndex])
        }
        
        // check if there are 3 cards in the selectedCards array
        // if there are, call the check function then remove all cards from the selectedCards array
            // because those 3 are either matched not not matched, in both cases we need to reset the array
        // else, don't remove any card from the selectedCards array
        if selectedCards.count == 3 {
            // perform check here
        }
    }
    
    // Check if the 3 selected cards matched
    func checkMatch() {
        
    }
}
