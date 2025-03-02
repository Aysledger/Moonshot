//
//  CrewRoster.swift
//  Moonshot
//
//  Created by Aytan Gurbanova on 19.02.2025.
//

import SwiftUI

struct CrewRoster: View {
  let crew: [MissionView.CrewMember]
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack {
        ForEach(crew, id: \.role) { crewMember in
          NavigationLink(value: crewMember.astronaut) {
            HStack {
              Image(crewMember.astronaut.id)
                .resizable()
                .frame(width: 104, height: 72)
                .clipShape(.capsule)
                .overlay(
                  Capsule()
                    .strokeBorder(.white, lineWidth: 1 )
                )
              VStack(alignment: .leading) {
                Text(crewMember.astronaut.name)
                  .foregroundStyle(.white)
                  .font(.headline)
                Text(crewMember.role)
                  .foregroundStyle(.white.opacity(0.5))
              }
            }
            .padding(.horizontal)
          }
        }
      }
    }
    .navigationDestination(for: Astronaut.self) { astronaut in
      AstronautView(astronaut: astronaut)
    }
  }
}

#Preview {
  CrewRoster(crew: [])
}
