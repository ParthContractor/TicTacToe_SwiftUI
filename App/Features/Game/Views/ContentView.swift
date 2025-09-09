//
//  ContentView.swift
//  TicTacToe_SwiftUI
//
//  Created by Parth Contractor on 9/9/2025.
//

import SwiftUI
import Observation

struct ContentView: View {
  @Bindable var vm: GameViewModel
  init(vm: GameViewModel) { self.vm = vm }

  var body: some View {
    VStack(spacing: 12) {
      NInputHeader(vm: vm)
      GeometryReader { geo in BoardArea(vm: vm, canvasSize: geo.size) }
      StatusBar(text: vm.statusText)

      // Show Reset only after win/draw
      if case .playing = vm.status {
        EmptyView()
      } else {
        ResetControl(vm: vm)
      }
    }
    .padding()
  }
}

