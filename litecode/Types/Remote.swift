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
