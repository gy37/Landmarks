//
//  ContentView.swift
//  Landmarks
//
//  Created by gaoshenyu on 2022/6/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
        HikeView(hike: ModelData().hikes[0])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
