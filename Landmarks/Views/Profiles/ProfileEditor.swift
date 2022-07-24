//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by gaoshenyu on 2022/7/24.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    
    var body: some View {
        List {
            HStack {
                Text("Username").bold()
                Spacer()
                TextField("Username", text: $profile.username)
                    .multilineTextAlignment(.trailing)
            }
            
            Toggle(isOn: $profile.prefersNotification, label: {
                Text("Enable Notifications").bold()
            })
            
            VStack(alignment: .leading, spacing: 20, content: {
                Text("Seasonal Photo").bold()
                Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases) { (season) in
                        Text(season.rawValue).tag(season)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            })
            
            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                Text("Goal Date").bold()
            }
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
