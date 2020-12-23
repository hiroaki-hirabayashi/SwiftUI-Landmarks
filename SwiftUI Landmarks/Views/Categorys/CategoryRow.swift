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
            //カテゴリー名(上段)
            Text(self.categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            //配列要素のスクロールビュー
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(self.items) { landmark in
                        CategoryItem(landmark: landmark)
                    }
                }
            }
                .frame(height: 185) //スクロールビューのフレームの高さ
        }
    }
}

struct CategoryItem: View {
    var landmark: Landmark
    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .resizable() //画像をリサイズする
                .frame(width: 155, height: 155) //画像サイズ
                .cornerRadius(5) //画像の角の丸み
            Text(landmark.name) //ランドマーク名（下段）
                .font(.caption)
        }
            .padding(.leading, 15) //各ランドマーク画像の間隔
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
