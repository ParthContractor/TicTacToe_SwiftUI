//
//  BoardArea.swift
//  TicTacToe_SwiftUI
//
//  Created by Parth Contractor on 9/9/2025.
//

import SwiftUI
import Observation

struct BoardArea: View {
  @Bindable var vm: GameViewModel
  let canvasSize: CGSize

  private let spacing: CGFloat = 6
  private let minTap: CGFloat = 44

  var body: some View {
    let side = min(canvasSize.width, canvasSize.height)
    let cell = floor((side - spacing * CGFloat(vm.n - 1)) / CGFloat(vm.n))

    if cell < minTap {
      TooDenseView(suggested: vm.suggestedMax(for: canvasSize, minTap: minTap, spacing: spacing))
    } else {
      LazyVGrid(
        columns: Array(repeating: GridItem(.fixed(cell), spacing: spacing), count: vm.n),
        spacing: spacing
      ) {
        ForEach(0..<(vm.n * vm.n), id: \.self) { i in
          Button { vm.tapCell(i) } label: {
            CellView(symbol: vm.cells[i], size: cell)
          }
          .disabled(!vm.isCellEnabled(i))
          .accessibilityIdentifier("boardCell-\(i)")
        }
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
      .padding(.top, 8)
    }
  }
}



