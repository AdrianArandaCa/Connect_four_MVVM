//
//  LanguageManager.swift
//  Connect_four_MVVM
//
//  Created by Dev on 25/11/23.
//

import Foundation

class LanguageManager {
    static let shared = LanguageManager()
    
    private var currentLanguageCode = "es"
    
    func localizedString(key: String) -> String {
        let path = Bundle.main.path(forResource: currentLanguageCode, ofType: "lproj")
        if let path = path {
            let _ = Bundle(path: path)
        }
        return NSLocalizedString(key, comment: "")
    }
    
    func setLanguage(_ languageCode: String) {
        guard Bundle.main.localizations.contains(languageCode) else {
            print("Language not supported: \(languageCode)")
            return
        }
        currentLanguageCode = languageCode
    }
}
