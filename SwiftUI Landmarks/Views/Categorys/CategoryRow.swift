//
//  CategoryRow.swift
//  SwiftUI Landmarks
//
//  Created by 平林宏淳 on 2020/12/23.
//  Copyright © 2020 Hiroaki_Hirabayashi. All rights reserved.
//

import SwiftUI

struct CategoryRow: View {
    
    var categoryName: String
    var items: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading) {
            //カテゴリー名
            Text(self.categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            //配列要素のスクロールビュー
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(self.items) { landmark in
                        Text(landmark.name)
                    }
                }
            }
                .frame(height: 185) //スクロールビューのフレームの高さ
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(
            //LandmarkData[0]内の「category」項目を表示
            categoryName: landmarkData[0].category.rawValue,
           //LandmarkData配列の最初の4つを表示
            items: Array(landmarkData.prefix(4))
        )
    }
}
