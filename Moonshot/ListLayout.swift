//
//  ListLayout.swift
//  Moonshot
//
//  Created by Aytan Gurbanova on 19.02.2025.
//

import SwiftUI

struct ListLayout: View {
  let astronauts: [String: Astronaut]
  let missions: [Mission]
  
  var body: some View {
    List(missions) { mission in
      NavigationLink(value: mission) {
        HStack {
          Image(mission.image)
            .resizable()
            .scaledToFit()
            .frame(width: 40, height: 40)
          
          VStack(alignment: .leading) {
            Text(mission.displayName)
              .font(.headline)
            
            Text(mission.formattedLaunchDate)
          }
        }
      }
      .listRowBackground(Color.darkBackground)
    }
    .listStyle(.plain)
  }
}

#Preview {
  ListLayout(astronauts: Bundle.main.decode("astronauts.json"), missions: Bundle.main.decode("missions.json"))
    .preferredColorScheme(.dark)
}
