//
//  Model.swift
//  Connect_four_MVVM
//
//  Created by Dev on 18/11/23.
//

import Foundation
import SwiftUI

enum PlayerColor: String {
    case none
    case red = "red"
    case yellow = "yellow"
}

struct Player: Hashable {
    var name: String
    var playerColor: PlayerColor
    var isWinner: Bool = false
    var wins: Int = 0
}

struct GamePieceButton: Hashable {
    var row: Int
    var column: Int
    var foregroundColor: Color
    var player : Player?
}

struct ArrowButton: Hashable {
    var column: Int
}
