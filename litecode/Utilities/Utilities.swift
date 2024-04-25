//
//  Utilities.swift
//  litecode
//
//  Created by Krisna Pranav on 25/04/24.
//

import Foundation

// readable byte count
func humanReadableByteCount(bytes: Int) -> String {
    if bytes < 1000 { return "\(bytes) B" }
    let exp = Int(log2(Double(bytes)) / log2(1000.0))
    let unit = ["KB", "MB", "GB", "TB", "PB", "EB"][exp - 1]
    let number = Double(bytes) / pow(1000, Double(exp))
    return String(format: "%.1f %@", number, unit)
}

struct CodableWrapper<Value: Codable> {
    var value: Value
}

extension CodableWrapper: RawRepresentable {
    typealias RawValue = String
    
    var rawValue: RawValue {
        guard
            let data = try? JSONEncoder().encode(value),
            let string = String(data: data, encoding: .utf8)
        else {
            return ""
        }
        
        return string
    }
}

extension CodableWrapper: Equatable {
    static func == (lhs: CodableWrapper, rhs: CodableWrapper) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}
