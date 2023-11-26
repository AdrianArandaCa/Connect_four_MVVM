//
//  Matrix.swift
//  Connect_four_MVVM
//
//  Created by Dev on 18/11/23.
//

import Foundation
import UIKit
import SwiftUI

struct Matrix {

    static let rows = 6
    static let columns = 7
    
    static func getBoard() -> [[GamePieceButton]] {
        var board = Array(repeating: Array(repeating: GamePieceButton.init(row: -1, column: -1, foregroundColor: .white, player: nil), count: columns), count: rows)
        for r in 0 ..< rows - 1 {
            for c in 0 ..< columns - 1 {
                let gamePieceButton = GamePieceButton.init(row: r, column: c, foregroundColor: .white, player: nil)
                board[r][c] = gamePieceButton
            }
        }
        return board
    }
    
    static func getArrows() -> [ArrowButton] {
        var arrows = [ArrowButton]()
        for c in 0 ..< columns {
            let arrowButton = ArrowButton.init(column: c)
            arrows.append(arrowButton)
        }
        return arrows
    }
    
    static let matrixSectionGrid: (CGFloat) -> [GridItem] = { width in
        return Array(repeating: GridItem(.flexible(minimum: width),spacing: 0), count: 7)
    }
    
    static let rowSectionGrid: (CGFloat) -> [GridItem] = { width in
        return Array(repeating: GridItem(.adaptive(minimum: width),spacing: 0), count: 6)
    }
    
    static let arrowsSectionGrid: (CGFloat) -> [GridItem] = { width in
        return Array(repeating: GridItem(.flexible(minimum: width), spacing: 0), count: 7)
    }
}
