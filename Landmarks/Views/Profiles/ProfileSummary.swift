//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by gaoshenyu on 2022/7/20.
//

import SwiftUI

struct ProfileSummary: View {
    @EnvironmentObject var modelData: ModelData
    var profile: Profile
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10, content: {
                Text("\(profile.username)'s Page")
                    .bold()
                    .font(.title)
                
                Divider()
                
                VStack(alignment: .leading, spacing: 10, content: {
                    Text("User Profile")
                        .font(.headline)
                    HStack(alignment: .center, spacing: nil, content: {
                        Text("Username:")
                        Spacer()
                        Text(profile.username)
                    })
                    HStack(alignment: .center, spacing: nil, content: {
                        Text("Enable Notifications:")
                        Spacer()
                        Text("\(profile.prefersNotification ? "On" : "Off" )")
                    })
                    HStack(alignment: .center, spacing: nil, content: {
                        Text("Seasonal Photos:")
                        Spacer()
                        Text("\(profile.seasonalPhoto.rawValue)")
                    })
                    HStack(alignment: .center, spacing: nil, content: {
                        Text("Goal Date:")
                        Spacer()
                        Text(profile.goalDate, style: .date)
                    })
                })
                
                Divider()
                
                VStack(alignment: .leading, spacing: nil, content: {
                    Text("Completed Badges")
                        .font(.headline)
                    
                    ScrollView(.vertical, showsIndicators: true, content: {
                        HStack(content: {
                            HikeBadge(name: "First Hike")
                            HikeBadge(name: "Earth Day")
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "Tenth Hike")
                                .grayscale(0.50)
                                .hueRotation(Angle(degrees: 45))
                        })
                        .padding(.bottom)
                    })
                })
                
                Divider()
                
                VStack(alignment: .leading, spacing: nil, content: {
                    Text("Recent Hikes")
                        .font(.headline)
                    HikeView(hike: modelData.hikes[0])
                })
            })
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
            .environmentObject(ModelData())
    }
}
