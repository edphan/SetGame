//
//  CardView.swift
//  Set
//
//  Created by Edward Phan on 2022-01-26.
//

import SwiftUI

struct CardView: View {
    let card: Card
    var body: some View {
        Text(card.shape)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card(number: 3, color: "blue", shape: "rectangle", shading: "solid"))
    }
}
