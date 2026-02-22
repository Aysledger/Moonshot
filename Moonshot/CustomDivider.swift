//
//  CustomDivider.swift
//  Moonshot
//
//  Created by Aytan Gurbanova on 22.02.2026.
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
