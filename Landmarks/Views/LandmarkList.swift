//
//  LandmarkList.swift
//  Landmarks
//
//  Created by gaoshenyu on 2022/6/26.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView {
            //Q: Value of protocol type 'View' cannot conform to 'View'; only struct/enum/class types can conform to protocols
            //A: delete `-> View` in Closure
            List(landmarks) { (landmark) in
                NavigationLink(
                    destination: LandmarkDetail(landmark: landmark),
                    label: {
                        LandmarkRow(landmark: landmark)
                    })
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone 12", "iPhone 12 Pro Max"], id: \.self) { (deviceName) in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
