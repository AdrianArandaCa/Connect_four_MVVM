//
//  Extension.swift
//  Connect_four_MVVM
//
//  Created by Dev on 25/11/23.
//

import Foundation
import SwiftUI

extension String {
    func localized() -> String {
        return LanguageManager.shared.localizedString(key: self)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorners(radius: radius, corners: corners))
    }
}
