//
//  ProfileHost.swift
//  Landmarks
//
//  Created by gaoshenyu on 2022/7/20.
//

import SwiftUI

struct ProfileHost: View {
    @EnvironmentObject var modelData: ModelData
    @Environment(\.editMode) var editMode
    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20, content: {
            HStack(alignment: .center, spacing: nil, content: {
                if editMode?.wrappedValue == .active {
                    Button("Cancel") {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            })
            
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear(perform: {
                        draftProfile = modelData.profile
                    })
                    .onDisappear(perform: {
                        modelData.profile = draftProfile
                    })
            }
            
        })
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
