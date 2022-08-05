//
//  NotificationView.swift
//  WatchLandmarks Extension
//
//  Created by gaoshenyu on 2022/8/1.
//

import SwiftUI

struct NotificationView: View {
    var title: String?
    var message: String?
    var landmark: Landmark?
    
    var body: some View {
        VStack(alignment: .center, spacing: nil, content: {
            if landmark != nil {
                CircleImage(imageName: landmark!.imageName)
                    .scaledToFit()
            }
            
            Text(title ?? "Unkown Landmark")
                .font(.headline)
            
            Divider()
            
            Text(message ?? "You are 5 miles of one of your favorite landmarks.")
                .font(.caption)
        })
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NotificationView()
            NotificationView(title: "Turtle Rock",
                             message: "You are within 5 miles of Turtle Rock.",
                             landmark: ModelData().landmarks[0])
        }
    }
}
