//
//  LiteCodeAppContributionPointManager.swift
//  litecode
//
//  Created by Krisna Pranav on 28/04/24.
//

import Foundation
import SwiftUI

protocol LiteCodeAppContributionPointManager: ObservableObject {
    associatedtype Item where Item: Identifiable, Item.ID == UUID
    var items: [Item] { get set }
    func registerItem(item: Item)
    func deregisterItem(id: UUID)
}

extension LiteCodeAppContributionPointManager {
    func registerItem(item: Item) {
        items.append(item)
    }
    
    func deregisterItem(id: UUID) {
        items.removeAll(where: { $0.id == id })
    }
}
