//
//  LegBoardView.swift
//  Connect_four_MVVM
//
//  Created by Dev on 23/11/23.
//

import SwiftUI

struct LegBoardView: View {
    var width: CGFloat
    var height: CGFloat
    var aligmentRectangle: HorizontalAlignment
    
    init(width: CGFloat, height: CGFloat, aligmentRectangle: HorizontalAlignment) {
        self.width = width
        self.height = height
        self.aligmentRectangle = aligmentRectangle
    }
    var body: some View {
        VStack(alignment: .center, spacing: -15) {
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [lightBlue, GrayBlue]),
                                     startPoint: aligmentRectangle == .trailing ? .leading : .trailing,
                                     endPoint: aligmentRectangle == .trailing ? .trailing : .leading))
                .frame(width: width, height: height)
            .cornerRadius(40, corners: [.topLeft, .topRight])
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [lightBlue, GrayBlue]),
                                     startPoint: aligmentRectangle == .trailing ? .leading : .trailing,
                                     endPoint: aligmentRectangle == .trailing ? .trailing : .leading))
                .frame(width: width * 1.8, height: height * 0.3)
            .cornerRadius(50, corners: [.topLeft, .topRight])
        }
    }
}

struct LegBoardView_Previews: PreviewProvider {
    static var previews: some View {
        LegBoardView(width: 100, height: 200, aligmentRectangle: .trailing)
    }
}
