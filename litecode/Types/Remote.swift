//
//  Remote.swift
//  litecode
//
//  Created by Krisna Pranav on 25/04/24.
//

import Foundation

enum RemoteType: String, CaseIterable, Identifiable {
    case sftp
    case ftp
    case ftps
    var id: String { self.rawValue }
}

enum RemoteAuthenticationMode {
    case plainUsernamePassword(URLCredential)
    case inFileSSHKey(URLCredential, URL?)
    case inMemorySSHKey(URLCredential, String)
}

struct RemoteHost: Codable {
    var url: String
    var useKeyAuth: Bool
    var displayName: String?
    var privateKeyContentKeychainID: String?
    var privateKeyPath: String?
    
    var rowDisplayName: String {
        displayName ?? URL(string: self.url)?.host ?? ""
    }
}
