import UIKit


/// Access Modifiers: Private, fileprivate, internal (default), public, open

class Singleton {
    
    static let shared = Singleton()
    static func getUserInfo() -> String {
        return "9283u23"
    }
    
    static let userInfo = "luke@gmail.com"
    
    var userInfoTwo = "luke@gmail.com"
    
    private init() {}
    
}

Singleton.getUserInfo()
Singleton.userInfo
Singleton.shared.userInfoTwo

/// Built-in singletons
URLSession.shared
UserDefaults.standard
FileManager.default
