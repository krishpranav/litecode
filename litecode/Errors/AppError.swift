//
//  AppError.swift
//  litecode
//
//  Created by Krisna Pranav on 25/04/24.
//

import Foundation

enum AppError: String {
    case unknownFileFormat = "errors.unknown_file_format"
    case editorDoesNotExist = "errors.editor_does_not_exist"
    case editorIsNotReady = "errors.editor_is_not_ready"
    case encodingFailed = "errors.failed_to_save_file.encoding.failed"
    case fileModifiedByAnotherProcess = "errors.file_modified_by_another_process"
}


extension AppError: LocalizedError {
    var errorDescription: String? {
        NSLocalizedString(self.rawValue, comment: "")
    }
}
