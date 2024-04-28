//
//  KeyChainAccessor.swift
//  litecode
//
//  Created by Krisna Pranav on 28/04/24.
//

import Foundation

class KeyChainAccessor {
    static let shared = KeyChainAccessor()
    
    public func storeObject(value: String) -> UUID {
        let uuid = UUID()
        KeychainWrapper.standard.set(value, forKey: uuid.uuidString)
        return uuid
    }
    
    public func storeObject(for key: String, value: String) {
        KeychainWrapper.standard.set(value, forKey: key)
    }
    
    public func getObjectString(for key: String) -> String? {
        KeychainWrapper.standard.string(forKey: key)
    }
    
    @discardableResult
    public func removeObjectForKey(for key: String) -> Bool {
        KeychainWrapper.standard.removeObject(forKey: key)
    }
    
    public func hasCredentials(for url: String) -> Bool {
        KeychainWrapper.standard.hasValue(forKey: "username;\(url)")
        && KeychainWrapper.standard.hasValue(forKey: "password;\(url)")
    }
    
    public func getCredentials(for url: String) -> URLCredential? {
        guard
            let username = KeychainWrapper.standard.string(forKey: "username;\(url)"),
            let password = KeychainWrapper.standard.string(forKey: "password;\(url)")
        else {
            return nil
        }
        return URLCredential(user: username, password: password, persistence: .none)
    }
    
    public func storeCredentials(username: String, password: String, for url: String) {
        KeychainWrapper.standard.set(
            username, forKey: "username;\(url)"
        )
        KeychainWrapper.standard.set(
            password, forKey: "passwords;\(url)"
        )
    }
    
    public func removeCredentials(for url: String) ->  Bool {
        KeychainWrapper.standard.removeObject(forKey: "username;\(url)")
        && KeychainWrapper.standard.removeObject(forKey: "password;\(url)")
    }
}
