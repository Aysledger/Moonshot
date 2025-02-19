//
//  AstronautView.swift
//  Moonshot
//
//  Created by Aytan Gurbanova on 19.02.2025.
//

import SwiftUI

struct AstronautView: View {
  let astronaut: Astronaut
  var body: some View {
    ScrollView {
      VStack {
        Image(astronaut.id)
          .resizable()
          .scaledToFit()
        Text(astronaut.description)
          .padding()
      }
    }
    .navigationTitle(astronaut.name)
    .navigationBarTitleDisplayMode(.inline)
    .background(.darkBackground)
  }
}

#Preview {
  let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
  AstronautView(astronaut: astronauts["aldrin"]!)
    .preferredColorScheme(.dark)
}
