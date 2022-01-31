//
//  Card.swift
//  Set
//
//  Created by Edward Phan on 2022-01-26.
//

import Foundation
import SwiftUI

struct Card: Identifiable {
    var id: UUID
    var numberOfShapes: Int
    var color: Color
    var shape: CardShapes
    var shading: CardShadings
    var isMatched = false
}
