//
//  hiddenSystemOverlays.swift
//  litecode
//
//  Created by Krisna Pranav on 28/04/24.
//

import Foundation
import SwiftUI

extension View {
    @ViewBuilder
    func hiddenSystemOverlays() -> some View {
        if #available(iOS 16, *) {
            self.persistentSystemOverlays(.hidden)
        } else {
            self
        }
    }
}
