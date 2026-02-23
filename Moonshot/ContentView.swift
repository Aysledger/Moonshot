//
//  ContentView.swift
//  Moonshot
//
//  Created by Aytan Gurbanova on 21.02.2026.
//

import SwiftUI

struct ContentView: View {
  @AppStorage("showingGrid") private var showingGrid = false
  let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
  let missions: [Mission] = Bundle.main.decode("missions.json")
  
  var body: some View {
    NavigationStack {
      Group {
        if showingGrid {
          GridLayout(astronauts: astronauts, missions: missions)
        } else {
          ListLayout(astronauts: astronauts, missions: missions)
        }
      }
      .navigationTitle("Moonshot")
      .background(.darkBackground)
      .preferredColorScheme(.dark)
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
      .navigationDestination(for: Mission.self) { mission in
          MissionView(mission: mission, astronauts: astronauts)
      }
    }
  }
}

#Preview {
  ContentView()
}
