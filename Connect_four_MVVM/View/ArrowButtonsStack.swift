//
//  ArrowButtonsStack.swift
//  Connect_four_MVVM
//
//  Created by Dev on 19/11/23.
//

import SwiftUI

struct ArrowButtonsStack: View {
    
    @ObservedObject var viewModel: ViewModel
    @Binding var showAlert : Bool
    
    let data: [ArrowButton]
    let width: CGFloat
    let height: CGFloat
    
    init(viewModel: ViewModel,
         data: [ArrowButton],
         showAlert: Binding<Bool>,
         width: CGFloat,
         height: CGFloat) {
        self.viewModel = viewModel
        self.data = data
        self._showAlert = showAlert
        self.width = width
        self.height = height
    }
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(data.indices, id:\.self) { column in
                Button(action: {
                    viewModel.dropDisk(column: column)
                    if viewModel.isWinner {
                        showAlert = true
                    }
                }, label: {
                   Circle()
                        .shadow(radius: 5)
                        .overlay(
                            linealGradientBlue
                        )
                        .mask(Image(systemName: "arrow.down.circle.fill")
                            .font(.system(size: width / CGFloat(data.count), weight: .bold))
                        )
                        .background(.white)
                        .cornerRadius(40)
                })
            }
        }
        .padding()
        .frame(width: width)
    }
}

struct ArrowButtonsStack_Previews: PreviewProvider {
    static var previews: some View {
        ArrowButtonsStack(viewModel: ViewModel(),data: ViewModel().arrows, showAlert: .constant(false),width: 300, height: 200)
    }
}
