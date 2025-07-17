import Foundation
import Combine

class TranslationManager: ObservableObject {
    static let shared = TranslationManager()
    
    @Published var selectedLanguage: String = "en"
    @Published private(set) var translations: [String: String] = [:] // Cache
    
    private init() {}
    
    func translate(_ text: String, completion: @escaping (String) -> Void) {
        guard let url = URL(string: "https://libretranslate.com/translate") else {
            completion(text)
            return
        }
        
        let parameters: [String: Any] = [
            "q": text,
            "source": "en",  // or detect
            "target": selectedLanguage,
            "format": "text"
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(text)
                return
            }
            
            if let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
               let translatedText = json["translatedText"] as? String {
                DispatchQueue.main.async {
                    completion(translatedText)
                }
            } else {
                DispatchQueue.main.async {
                    completion(text)
                }
            }
        }.resume()
    }
}
