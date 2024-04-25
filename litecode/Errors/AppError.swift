//
//  AppError.swift
//  litecode
//
//  Created by Krisna Pranav on 25/04/24.
//

import Foundation

enum AppError: String {
    case unknownFileFormat = ""
}


extension AppError: LocalizedError {
    var errorDescription: String? {
        NSLocalizedString(self.rawValue, comment: "")
    }
}
