//
//  ResultControls.swift
//  TicTacToe_SwiftUI
//
//  Created by Parth Contractor on 9/9/2025.
//


import SwiftUI
import Observation

struct ResetControl: View {
  @Bindable var vm: GameViewModel

  var body: some View {
    Button("Reset") { vm.reset() }
      .buttonStyle(.borderedProminent)
      .accessibilityIdentifier("btnReset")
      .padding(.top, 4)
  }
}

