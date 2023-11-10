import Foundation

// ConfigurationManager class to manage configuration settings
class ConfigurationManager {
    // Singleton instance
    static let shared = ConfigurationManager()
    
    // Constants
    struct Constants {
        static let apiKey = "API_KEY"
    }
    // API key property
    private(set) var apiKey: String = ""
    // Hose url
    private(set) var host: String = "https://api.tfl.gov.uk"

    // Private initializer to enforce singleton pattern
    private init() {
        loadConfiguration()
    }

    // Load API key from Keychain, environment variables, or plist
    private func loadConfiguration() {
        // Try to get API_KEY from the Keychain
        if let storedApiKeyData = KeychainService.load(key: Constants.apiKey) {
            // Convert Data to String
            if let storedApiKey = String(data: storedApiKeyData, encoding: .utf8) {
                self.apiKey = storedApiKey
            }
        } else {
            // If Keychain does not have the API_KEY, try to get it from environment variables
            if let apiKey = ProcessInfo.processInfo.environment[Constants.apiKey] {
                self.apiKey = apiKey
                // Save the API_KEY to Keychain for future use
                saveToKeychain(apiKey: apiKey)
            } else {
                // If environment variables don't have it, load from plist as a fallback
                loadConfigurationFromPlist()
            }
        }
    }

    // Load API key from Keychain
    private func loadConfigurationFromKeychain() {
        if let storedApiKeyData = KeychainService.load(key: Constants.apiKey) {
            // Convert Data to String
            if let storedApiKey = String(data: storedApiKeyData, encoding: .utf8) {
                self.apiKey = storedApiKey
            }
        }
    }

    // Save API key to Keychain
    private func saveToKeychain(apiKey: String) {
        // Convert String to Data
        if let apiKeyData = apiKey.data(using: .utf8) {
            KeychainService.save(key: Constants.apiKey, data: apiKeyData)
        }
    }

    // Load API key from plist
    private func loadConfigurationFromPlist() {
        guard let path = Bundle.main.path(forResource: "Config", ofType: "plist"),
            let config = NSDictionary(contentsOfFile: path) as? [String: Any],
            let apiKey = config[Constants.apiKey] as? String else {
                return
        }
        self.apiKey = apiKey
    }
}
