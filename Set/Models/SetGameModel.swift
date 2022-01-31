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
        
        // add all card with isSelected == true to selectedCards array
        selectedCards = cards.filter({ card in
            card.isSelected == true
        })
        
        // check if there are 3 cards in the selectedCards array
        // if there are, call the check function then remove all cards from the selectedCards array
            // because those 3 are either matched not not matched, in both cases we need to reset the array
        // else, don't remove any card from the selectedCards array
        if selectedCards.count == 3 {
            // perform check here
            
            // remove all cards in the selectedCards array
            selectedCards.removeAll()
        }
        print(selectedCards)
    }
    
    // Check if the 3 selected cards matched
    func checkMatch() {
        
    }
}
