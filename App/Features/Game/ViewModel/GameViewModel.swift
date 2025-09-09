//
//  GameViewModel.swift
//  TicTacToe_SwiftUI
//
//  Created by Parth Contractor on 9/9/2025.
//

import Observation
import GameCore
import CoreGraphics

@Observable
final class GameViewModel {
    private(set) var state: GameState
    
    init(n: Int = 3) { self.state = GameState(n: max(3, n)) }
    
    // Read API (for Views)
    var n: Int { state.n }
    var cells: [String] {
        state.board.map { $0.map { $0.rawValue.uppercased() } ?? "" }
    }
    var statusText: String {
        switch Rules.status(for: state) {
        case .playing: return "\(state.current.rawValue.uppercased()) to move"
        case .win(let p): return "\(p.rawValue.uppercased()) wins!"
        case .draw: return "Draw"
        }
    }
    func isCellEnabled(_ i: Int) -> Bool {
        guard case .playing = Rules.status(for: state) else { return false }
        return i >= 0 && i < state.board.count && state.board[i] == nil
    }
    
    // Intents
    func tapCell(_ i: Int) {
        guard isCellEnabled(i) else { return }
        state = Rules.apply(i, to: state)
    }
    
    func newGame(n: Int? = nil, keepPlayers: Bool = false) {
        let nextN = max(3, n ?? state.n)
        let starter: Player = keepPlayers ? state.current : .x
        state = GameState(n: nextN, current: starter)
    }
    
    // Fit guidance (Views decide UI)
    func suggestedMax(for size: CGSize, minTap: CGFloat = 44, spacing: CGFloat = 6) -> Int {
        let side = max(0, min(size.width, size.height))
        let best = (side + spacing) / (minTap + spacing)
        return max(3, Int(floor(best)))
    }
    // Expose current status so Views can branch cleanly.
    var status: GameStatus { Rules.status(for: state) }
    
    // True once win/draw happens.
    var isTerminal: Bool {
        if case .playing = status { return false } else { return true }
    }
    
    // Start over at same N; X starts (classic "Reset").
    func reset() { newGame(n: nil, keepPlayers: false) }
}
