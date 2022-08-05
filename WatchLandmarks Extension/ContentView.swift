//
//  ContentView.swift
//  WatchLandmarks Extension
//
//  Created by gaoshenyu on 2022/8/1.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
