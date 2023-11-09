import Foundation

enum Method: String {
    case get = "GET"
    case post = "POST"
}

struct Request<Value> {
    
    var method: Method
    var path: String
    
    init(method: Method = .get, path: String) {
        self.method = method
        self.path = path
    }
    
}
