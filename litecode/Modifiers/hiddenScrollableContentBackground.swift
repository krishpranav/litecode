//
//  hiddenScrollableContentBackground.swift
//  litecode
//
//  Created by Krisna Pranav on 28/04/24.
//

import Foundation
import SwiftUI

extension View {
    @ViewBuilder
    func hiddenScrollableContentBackground() -> some View {
        if #available(iOS 16, *) {
            self
                .scrollContentBackground(.hidden)
        } else {
            self
        }
    }
}
