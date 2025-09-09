//
//  ContentView.swift
//  TicTacToe_SwiftUI
//
//  Created by Parth Contractor on 9/9/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 16) {
            NInputHeader(title: "TicTacToe_SwiftUI")
            BoardArea()
            StatusBar(text: "Ready")
        }
        .padding()
    }
}
