//
//  CircleImage.swift
//  Landmarks
//
//  Created by gaoshenyu on 2022/6/26.
//

import SwiftUI

struct CircleImage: View {
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            .overlay (
                Circle().stroke(Color.green, lineWidth: 4)
            )
            .shadow(radius: 7)
        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(imageName: "turtle_rock")
    }
}
