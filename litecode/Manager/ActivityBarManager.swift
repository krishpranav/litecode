//
//  ActivityBarManager.swift
//  litecode
//
//  Created by Krisna Pranav on 25/04/24.
//

import Foundation
import SwiftUI

enum ActivityBarBubble {
    case text(String)
    case systemImage(String)
}

struct ActivityBarItem: Identifiable {
    let id = UUID()
    let itemID: String
    var iconSystemName: String
    var title: LocalizedStringKey
    var shortcutKey: KeyEquivalent?
    var modifiers: EventModifiers?
    var view: AnyView
    var contextMenuItems: (() -> [ContextMenuItem])?
    var positionPrecedence: Int = 0
    var bubble: () -> ActivityBarBubble?
    var isVisible: (() -> Bool)
}

class ActivityBarManager: LiteCodeAppContributionPointManager {
    @Published var items: [ActivityBarItem] = []
    
    func itemForItemID(itemID: String) -> ActivityBarItem? {
        return items.first { $0.itemID == itemID }
    }
}
