//
//  ActivityBarItemView.swift
//  litecode
//
//  Created by Krisna Pranav on 25/04/24.
//

import SwiftUI

struct ContextMenuItem {
    let id = UUID()
    let actions: () -> Void
    let text: String
    let imageSystemName: String
}

struct ActivityBarItemView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ActivityBarItemView()
}
