//
//  CircleView.swift
//  Connect_four_MVVM
//
//  Created by Dev on 25/11/23.
//

import SwiftUI

struct CircleView: View {
    var colorFill: Color
    
    init(colorFill: Color) {
        self.colorFill = colorFill
    }
    
    var body: some View {
        ZStack {
            Circle()
                .fill(colorFill)
                .opacity(0.8)
            Circle()
                .fill(LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: .black, location: 0),
                        .init(color: .clear, location: 1)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ))
                .opacity(0.2)
        }
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(colorFill: .yellow)
    }
}
