//
//  MissionView.swift
//  Moonshot
//
//  Created by Aytan Gurbanova on 22.02.2026.
//

import SwiftUI

struct MissionView: View {
  struct CrewMember {
    let role: String
    let astronaut: Astronaut
  }
  
  let crew: [CrewMember]
  let mission: Mission
  
  var body: some View {
    ScrollView {
      VStack {
        Image(mission.image)
          .resizable()
          .scaledToFit()
          .containerRelativeFrame(.horizontal) { width, axis in
            width * 0.8
          }
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
        
        CrewRoaster(crew: crew)
        
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
  MissionView(mission: missions[4], astronauts: astronauts)
    .preferredColorScheme(.dark)
}
