//
//  StatusBar.swift
//  TicTacToe_SwiftUI
//
//  Created by Parth Contractor on 9/9/2025.
//

import SwiftUI

struct StatusBar: View {
  let text: String
  var body: some View {
    Text(text)
      .font(.title3).bold()
      .accessibilityIdentifier("statusLabel")
      .onAppear {
        UIAccessibility.post(notification: .announcement, argument: text)
      }
      .onChange(of: text) { _, newValue in
        UIAccessibility.post(notification: .announcement, argument: newValue)
      }
  }
}


