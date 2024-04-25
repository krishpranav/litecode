//
//  SourceControlError.swift
//  litecode
//
//  Created by Krisna Pranav on 25/04/24.
//

import Foundation

enum SourceControlError: Error {
    case gitServiceProviderUnavailable
    case noChangesAvailable
    case invalidURL
    case authorIdentityMissing
}
