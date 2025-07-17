import Foundation
import Combine
import LibreTranslate

class TranslationManager: ObservableObject {
    static let shared = TranslationManager()
    
    @Published var selectedLanguage: String = "en"
    
    private let translator = Translator("https://libretranslate.com")

    func translate(_ text: String, completion: @escaping (String) -> Void) {
        guard selectedLanguage != "en" else {
            completion(text)
            return
        }
        
        Task {
            do {
                let result = try await translator.translate(text, from: "en", to: selectedLanguage)
                DispatchQueue.main.async {
                    completion(result)
                }
            } catch {
                print("Translation error: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    completion(text)
                }
            }
        }
    }
}
