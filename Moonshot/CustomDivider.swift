//
//  CustomDivider.swift
//  Moonshot
//
//  Created by Aytan Gurbanova on 19.02.2025.
//

import SwiftUI

struct CustomDivider: View {
    var body: some View {
      Rectangle()
        .frame(height: 2)
        .foregroundStyle(.lightBackground)
        .padding(.vertical)
    }
}

#Preview {
    CustomDivider()
}
