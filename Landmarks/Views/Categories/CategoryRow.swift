//
//  CategoryRow.swift
//  Landmarks
//
//  Created by gaoshenyu on 2022/7/16.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading, spacing: nil, content: {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 15)
            
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(alignment: .top, spacing: 0, content: {
                    ForEach(items) { item in
                        NavigationLink(
                            destination: LandmarkDetail(landmark: item),
                            label: {
                                CategoryItem(landmark: item)
                            })
                    }
                })
            })
            .frame(height: 185)
        })
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    static var previews: some View {
        CategoryRow(
            categoryName: landmarks[0].category.rawValue,
            items: Array(landmarks.prefix(4))
        )
    }
}
