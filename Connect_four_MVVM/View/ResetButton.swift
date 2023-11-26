//
//  ResetButton.swift
//  Connect_four_MVVM
//
//  Created by Dev on 19/11/23.
//

import SwiftUI

struct ResetButton: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Button(action: {
                viewModel.resetPressed()
            }, label: {
                Label {
                    Text("RESET".localized())
                        .font(.system(size: 30, weight: .regular))
                        .foregroundColor(.white)
                        .padding(.trailing, 20)
                } icon: {
                    Image(systemName: "trash.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                        .foregroundColor(.white)
                        .padding(.leading, 20)
                }.padding()

            })
            .background(linealGradientBlue)
            .cornerRadius(20)
        }
    }
}

struct ResetButton_Previews: PreviewProvider {
    static var previews: some View {
        ResetButton(viewModel: ViewModel())
    }
}
