//
//  CardShapes.swift
//  Set
//
//  Created by Edward Phan on 2022-01-28.
//

import Foundation

enum CardShapes: CaseIterable, Equatable {
    case rectangle
    case circle
    case diamond
}

enum CardShadings: CaseIterable, Equatable {
    case transparent
    case open
    case solid
}
