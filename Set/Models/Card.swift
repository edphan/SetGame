//
//  Card.swift
//  Set
//
//  Created by Edward Phan on 2022-01-26.
//

import Foundation
import SwiftUI

struct Card: Identifiable, Equatable {
    var id: UUID
    var numberOfShapes: Int
    var color: Color
    var shape: CardShapes
    var shading: CardShadings
    var isSelected = false
    var isMatched = false
}
