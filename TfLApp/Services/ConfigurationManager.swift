
import Foundation

class ConfigurationManager {
    static let shared = ConfigurationManager()
    
    private(set) var apiKey: String = ""
    private(set) var host: String = ""

    private init() {
        loadConfiguration()
    }
    
    private func loadConfiguration() {
        guard let path = Bundle.main.path(forResource: "Config", ofType: "plist"),
            let config = NSDictionary(contentsOfFile: path) as? [String: Any],
            let apiKey = config["API_KEY"] as? String,
            let host = config["HOST_URL"] as? String else {
                return
        }
        self.apiKey = apiKey
        self.host = host
    }
}
