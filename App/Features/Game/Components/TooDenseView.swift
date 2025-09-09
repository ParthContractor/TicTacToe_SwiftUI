//
//  TooDenseView.swift
//  TicTacToe_SwiftUI
//
//  Created by Parth Contractor on 9/9/2025.
//

import SwiftUI

struct TooDenseView: View {
  let suggested: Int
  var body: some View {
    VStack(spacing: 8) {
      Image(systemName: "rectangle.and.hand.point.up.left").imageScale(.large)
      Text("Board too dense to tap").font(.headline)
      Text("Try N ≤ \(suggested)").foregroundStyle(.secondary)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .accessibilityIdentifier("tooDense")
  }
}


