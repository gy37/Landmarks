//
//  ContentView.swift
//  Landmarks
//
//  Created by gaoshenyu on 2022/6/26.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured;
    
    enum Tab {
        case featured
        case list
        case hike
        case badge
    }
    var body: some View {
        TabView(selection: $selection,
                content:  {
                    CategoryHome()
                        .tabItem {
                            Label("Featured", systemImage: "star")
                        }
                        .tag(Tab.featured)
                    LandmarkList()
                        .tabItem {
                            Label("List", systemImage: "list.bullet")
                        }
                        .tag(Tab.list)
                    HikeView(hike: ModelData().hikes[0])
                        .tabItem {
                            Label("Hike", systemImage: "flame")
                        }
                        .tag(Tab.hike)
                    Badge()
                        .tabItem {
                            Label("Badge", systemImage: "hexagon")
                        }
                        .tag(Tab.badge)
                })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
