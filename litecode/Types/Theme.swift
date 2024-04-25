//
//  Theme.swift
//  litecode
//
//  Created by Krisna Pranav on 25/04/24.
//

import SwiftUI
import Foundation

struct Theme {
    let id = UUID()
    let name: String
    let url: URL
    let isDark: Bool
    let preview: (Color, Color, Color, Color)
    
    lazy var data: Data = {
        try! Data(contentsOf: url)
    }()
    
    lazy var dictionary: [String: Any] = {
        try! JSONSerialization.jsonObject(with: data, options: .allowFragments)
        as! [String: Any]
    }()
    
    lazy var jsonString: String = {
        String(data: data, encoding: .utf8)!
    }()
}
