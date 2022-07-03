//
//  Badge.swift
//  Landmarks
//
//  Created by gaoshenyu on 2022/7/3.
//

import SwiftUI

struct Badge: View {
    var badgeSymbols: some View {
        ForEach(0..<6) { index in
            RotatedBadgeSymbol(angle: .degrees(Double(index) / Double(6)) * 360.0)
        }
        .opacity(0.5)
    }
    
    var body: some View {
        ZStack(content: {
            BadgeBackground()
            
            GeometryReader(content: { geometry in
                badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2, y: geometry.size.height * 3.0 / 4.0)
            })
        })
        .scaledToFit()
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
