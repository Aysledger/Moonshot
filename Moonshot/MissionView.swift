//
//  MissionView.swift
//  Moonshot
//
//  Created by Aytan Gurbanova on 19.02.2025.
//

import SwiftUI

struct MissionView: View {
  struct CrewMember: Hashable {
    let role: String
    let astronaut: Astronaut
  }
  
  let mission: Mission
  let crew: [CrewMember]
  
  var body: some View {
    ScrollView {
      VStack {
        Image(mission.image)
          .resizable()
          .scaledToFit()
          .containerRelativeFrame(.horizontal) { width, axis in
            width * 0.6
          }
          .padding(.bottom, 20)
        if let date = mission.launchDate {
          Label(date.formatted(date: .complete, time: .omitted), systemImage: "calendar")
        }
        
        VStack(alignment: .leading) {
          CustomDivider()
          
          Text("Mission Highlights")
            .font(.title.bold())
            .padding(.bottom, 5)
          
          Text(mission.description)
          
          CustomDivider()
          
          Text("Crew")
            .font(.title.bold())
            .padding(.bottom, 5)
        }
        .padding(.horizontal)
        
        CrewRoster(crew: crew)
      }
      .padding(.bottom)
    }
    .navigationTitle(mission.displayName)
    .navigationBarTitleDisplayMode(.inline)
    .background(.darkBackground)
  }
  
  init(mission: Mission, astronauts: [String: Astronaut]) {
    self.mission = mission
    self.crew = mission.crew.map { member in
      if let astronaut = astronauts[member.name] {
        return CrewMember(role: member.role, astronaut: astronaut)
      } else {
        fatalError("Missing \(member.name)")
      }
    }
  }
}

#Preview {
  let missions: [Mission] = Bundle.main.decode("missions.json")
  let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
  MissionView(mission: missions[0], astronauts: astronauts)
    .preferredColorScheme(.dark)
}
