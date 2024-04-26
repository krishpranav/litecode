//
//  ArchiveDir.swift
//  litecode
//
//  Created by Krisna Pranav on 26/04/24.
//

import Foundation
import CoreServices
import ZIPFoundation

func returnDirectoryAsBase64(url: URL, fileURL: URL) -> String {

    guard let archive = Archive(accessMode: .create), let content = try? String(contentsOf: fileURL)
    else { return "" }

    let urls = try? FileManager.default.contentsOfDirectory(
        at: url, includingPropertiesForKeys: nil)

    for i in urls ?? [] {
        do {
            if content.contains(i.deletingPathExtension().lastPathComponent) {
                try archive.addEntry(
                    with: i.lastPathComponent, relativeTo: i.deletingLastPathComponent())
            }
        } catch {
            print(error)
        }
    }
    let archiveData = archive.data
    let strBase64 = archiveData?.base64EncodedString(options: .lineLength64Characters) ?? ""
    return strBase64
}
