//
//  ContentView.swift
//  Moonshot
//
//  Created by Aytan Gurbanova on 16.02.2025.
//

import SwiftUI

struct ContentView: View {
  let astronauts: [String: Astronaut] = Bundle.main.decode( "astronauts.json")
  let missions: [Mission] = Bundle.main.decode("missions.json")
  
  @AppStorage("showingGrid") private var showingGrid = true
  
  var body: some View {
    NavigationStack {
      Group {
        if showingGrid {
          GridLayout(astronauts: astronauts, missions: missions)
        } else {
          ListLayout(astronauts: astronauts, missions: missions)
        }
      }
      .toolbar {
        Button {
          showingGrid.toggle()
        } label: {
          if showingGrid {
            Label("Show as table", systemImage: "list.dash")
          } else {
            Label("Show as grid", systemImage: "square.grid.2x2")
          }
        }
      }
      .navigationTitle("Moonshot")
      .background(.darkBackground)
      .preferredColorScheme(.dark)
      .navigationDestination(for: Mission.self) { mission in
        MissionView(mission: mission, astronauts: astronauts)
      }
    }
  }
}

#Preview {
  ContentView()
}
