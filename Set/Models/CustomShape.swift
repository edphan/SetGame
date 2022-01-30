//
//  CustomShape.swift
//  Set
//
//  Created by Edward Phan on 2022-01-29.
//

import Foundation
import SwiftUI

struct CustomShape: Shape {
    
    private let _path: (CGRect) -> Path

    init<S: Shape>(_ wrapped: S) {
        _path = { rect in
            let path = wrapped.path(in: rect)
            return path
        }
    }

    func path(in rect: CGRect) -> Path {
        return _path(rect)
    }
}
