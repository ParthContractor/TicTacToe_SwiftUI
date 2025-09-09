//
//  CellView.swift
//  TicTacToe_SwiftUI
//
//  Created by Parth Contractor on 9/9/2025.
//

import SwiftUI

struct CellView: View {
  let symbol: String
  let size: CGFloat
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 12).strokeBorder()
      Text(symbol).font(.system(size: max(18, size * 0.5), weight: .bold))
    }
    .frame(width: size, height: size)
  }
}


