//
//  Encoding.swift
//  litecode
//
//  Created by Krisna Pranav on 25/04/24.
//

import Foundation

struct CodeAppEncoding: Identifiable {
    let id = UUID()
    let encoding: String.Encoding
    let name: String
}

let AVAILABLE_ENCODING: [CodeAppEncoding] = [
    CodeAppEncoding(encoding: .utf8, name: "UTF-8")
]
