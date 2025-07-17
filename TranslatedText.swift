//
//  TranslatedText.swift
//  EcoMiles
//
//  Created by roby on 7/17/25.
// new thing for new commit

import SwiftUI
import Combine

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
