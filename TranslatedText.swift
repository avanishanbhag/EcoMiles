//
//  TranslatedText.swift
//  EcoMiles
//
//  Created by roby on 7/17/25.
//

import SwiftUI

struct TranslatedText: View {
    let original: String
    @State private var translated: String = ""
    
    var body: some View {
        Text(translated.isEmpty ? original : translated)
            .onAppear {
                TranslationManager.shared.translate(original) { result in
                    translated = result
                }
            }
            .onReceive(TranslationManager.shared.$selectedLanguage) { _ in
                TranslationManager.shared.translate(original) { result in
                    translated = result
                }
            }
    }
}
