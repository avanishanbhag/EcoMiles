import Foundation
import Combine

class TranslationManager: ObservableObject {
    static let shared = TranslationManager()
    
    @Published var selectedLanguage: String = "en"
        
        func translate(_ text: String, completion: @escaping (String) -> Void) {
            // Skip translation if English is selected
            guard selectedLanguage != "en" else {
                completion(text)
                return
            }

            let url = URL(string: "https://libretranslate.com/translate")!
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

            let body = "q=\(text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")&source=en&target=\(selectedLanguage)&format=text"
            request.httpBody = body.data(using: .utf8)

            URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data,
                   let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                   let translatedText = json["translatedText"] as? String {
                    DispatchQueue.main.async {
                        completion(translatedText)
                    }
                } else {
                    print("Translation error:", error?.localizedDescription ?? "Unknown error")
                    DispatchQueue.main.async {
                        completion(text)
                    }
                }
            }.resume()
        }
    }
