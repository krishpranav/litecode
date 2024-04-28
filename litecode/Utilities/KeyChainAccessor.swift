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
    
    
}
