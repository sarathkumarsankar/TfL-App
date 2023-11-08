
import Foundation

class ConfigurationManager {
    static let shared = ConfigurationManager()
    
    var apiKey: String = ""
    var host: String = ""
    
    private init() {
        loadConfiguration()
    }
    
    private func loadConfiguration() {
        if let path = Bundle.main.path(forResource: "Config", ofType: "plist"),
           let config = NSDictionary(contentsOfFile: path) as? [String: Any],
           let apiKey = config["API_KEY"] as? String, let host = config["HOST_URL"] as? String {
            self.apiKey = apiKey
            self.host = host
        }
    }
}
