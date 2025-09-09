//
//  NInputHeader.swift
//  TicTacToe_SwiftUI
//
//  Created by Parth Contractor on 9/9/2025.
//

import SwiftUI
import Observation

struct NInputHeader: View {
  @Bindable var vm: GameViewModel
  @State private var nText: String
  @State private var nError: String?

  init(vm: GameViewModel) {
    self.vm = vm
    _nText = State(initialValue: "\(vm.n)")
  }

  var body: some View {
    VStack(alignment: .leading, spacing: 4) {
      HStack(spacing: 8) {
        Text("N:")
        TextField("N", text: $nText)
          .keyboardType(.numberPad)
          .textFieldStyle(.roundedBorder)
          .frame(maxWidth: 80)
          .onSubmit(submit)
          .submitLabel(.done)
        Button("Apply", action: submit).buttonStyle(.borderedProminent)
      }
      if let err = nError {
        Text(err).font(.footnote).foregroundStyle(.red)
      }
    }
  }

  private func submit() {
    guard let v = Int(nText), v >= 3 else { nError = "Enter a number ≥ 3"; return }
    nError = nil
    vm.newGame(n: v)
  }
}


