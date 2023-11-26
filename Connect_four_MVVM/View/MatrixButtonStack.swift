//
//  MatrixButtonStack.swift
//  Connect_four_MVVM
//
//  Created by Dev on 18/11/23.
//

import SwiftUI

    
struct MatrixButtonStack: View {
    
    @ObservedObject var viewModel: ViewModel
    
    let data: [[GamePieceButton]]
    let width: CGFloat
    let height: CGFloat
    init(viewModel: ViewModel,
         data: [[GamePieceButton]],
         width: CGFloat,
         heigth: CGFloat) {
        self.viewModel = viewModel
        self.data = data
        self.width = width
        self.height = heigth
    }
    
    
    var body: some View {
        VStack(spacing: 10) {
            ForEach(data.indices, id: \.self) { row in
                HStack(spacing: 10) {
                    ForEach(data[row].indices, id: \.self) { col in
                        CircleView(colorFill: viewModel.board[row][col].foregroundColor == .white ? .white : viewModel.board[row][col].foregroundColor)
                    }
                }
            }
        }
        .padding()
        .frame(width: width, height: height)
        .background(linealGradientBlue)
        .cornerRadius(20, corners: [.topLeft, .topRight])
    }
}

struct MatrixButtonStack_Previews: PreviewProvider {
    static var previews: some View {
        MatrixButtonStack(viewModel: ViewModel(), data: ViewModel().board, width: 400, heigth: 200)
    }
}
