//
//  ContentView.swift
//  Moonshot
//
//  Created by Nacho Alaves on 23/7/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showAsList = false
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        NavigationView {
            ScrollView {
                if(!showAsList) {
                    LazyVGrid(columns: columns) {
                        ForEach(missions) { mission in
                            NavigationLink {
                                MissionView(mission: mission, astronauts: astronauts)
                            } label: {
                                VStack {
                                    Image(mission.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .padding()
                                    
                                    VStack {
                                        Text(mission.displayName)
                                            .font(.headline)
                                            .foregroundColor(.white)
                                        
                                        Text(mission.formattedLaunchDate)
                                            .font(.caption)
                                            .foregroundColor(.white.opacity(0.5))
                                    }
                                    .padding(.vertical)
                                    .frame(maxWidth: .infinity)
                                    .background(.lightBackground)
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.lightBackground)
                                )
                            }
                        }
                    }
                    .padding([.horizontal, .bottom])
                    
                } else {
                    // List view of the missions
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            /*.toolbar {
                Button {
                    showAsList.toggle()
                } label: {
                    Image(systemName: "list.bullet.clipboard")
                }
            }*/
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
