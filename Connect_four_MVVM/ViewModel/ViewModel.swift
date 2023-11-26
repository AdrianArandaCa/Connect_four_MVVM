//
//  ViewModel.swift
//  Connect_four_MVVM
//
//  Created by Dev on 18/11/23.
//

import Foundation
import SwiftUI

final class ViewModel: ObservableObject {
    
    @Published var board = Matrix.getBoard()
    @Published var isWinner : Bool = false
    @Published var playerWinner : Player?
    @Published var redPlayer: Player = .init(name: "RED".localized(),playerColor: .red, isWinner: false)
    @Published var yellowPlayer: Player = .init(name: "YELLOW".localized(), playerColor: .yellow, isWinner: false)
    @Published var redWins: String = "0"
    @Published var yellowWins: String = "0"
    
    private var currentPlayer : Player?
    var arrows = Matrix.getArrows()
    
    init() {
        startGame()
    }
    
    func startGame() {
        currentPlayer = redPlayer
    }
    
    func dropDisk(column: Int) {
        for row in stride(from: board.count - 1, through: 0, by: -1) {
            if board[row][column].player == .none {
                board[row][column].player = currentPlayer
                board[row][column].foregroundColor = currentPlayer?.playerColor == .red ? .red : .yellow
                if let currentPlayer = currentPlayer, checkConnect(player: currentPlayer) {
                    self.currentPlayer?.isWinner = true
                    
                    isWinner = true
                    playerWinner = self.currentPlayer
                    if playerWinner?.playerColor == .red {
                        redPlayer.wins += 1
                        redWins = "\(Int(redPlayer.wins))"
                    } else {
                        yellowPlayer.wins += 1
                        yellowWins = "\(Int(yellowPlayer.wins))"
                    }
                    break
                }
                switchPlayer()
                break
            }
        }
    }
    
    func switchPlayer() {
        if let currentPlayer = self.currentPlayer {
            self.currentPlayer = (currentPlayer.playerColor == .red ? yellowPlayer : redPlayer)
        }
    }
    
    func checkConnect(player: Player) -> Bool {
        if checkHorizontal(player: player) {
            return true
        } else if checkVertical(player: player) {
            return true
        } else if checkAscendingDiagonal(player: player) {
            return true
        } else if checkDescendingDiagonal(player: player) {
            return true
        }
        return false
    }
    
    func checkDescendingDiagonal(player: Player) -> Bool {
        for row in 0..<(board.count - 3) {
            for col in 0..<(board[row].count - 3) {
                if board[row][col].player == player &&
                    board[row + 1][col + 1].player == player &&
                    board[row + 2][col + 2].player == player &&
                    board[row + 3][col + 3].player == player {
                    return true
                }
            }
        }
        return false
    }
    
    func checkAscendingDiagonal(player: Player) -> Bool {
        for row in 3..<board.count {
            for col in 0..<(board[row].count - 3) {
                if board[row][col].player == player &&
                    board[row - 1][col + 1].player == player &&
                    board[row - 2][col + 2].player == player &&
                    board[row - 3][col + 3].player == player {
                    return true
                }
            }
        }
        return false
    }
    
    func checkVertical(player: Player)  -> Bool{
        for row in 0..<(board.count - 3) {
            for col in 0..<board[row].count {
                if board[row][col].player == player &&
                    board[row + 1][col].player == player &&
                    board[row + 2][col].player == player &&
                    board[row + 3][col].player == player {
                    return true
                }
            }
        }
        return false
    }
    
    func checkHorizontal(player: Player) -> Bool {
        for row in 0..<board.count {
            for col in 0..<(board[row].count - 3) {
                if board[row][col].player == player &&
                    board[row][col + 1].player == player &&
                    board[row][col + 2].player == player &&
                    board[row][col + 3].player == player {
                    return true
                }
            }
        }
        return false
    }
    
    func resetBoard() {
        board.removeAll()
        board = Matrix.getBoard()
        isWinner = false
        currentPlayer = redPlayer
    }
    
    func resetPressed() {
        yellowWins = "0"
        redWins = "0"
        redPlayer.wins = 0
        yellowPlayer.wins = 0
        resetBoard()
    }
}
