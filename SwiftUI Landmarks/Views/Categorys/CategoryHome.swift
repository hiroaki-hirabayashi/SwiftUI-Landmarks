//
//  CategoryHome.swift
//  SwiftUI Landmarks
//
//  Created by 平林宏淳 on 2020/12/23.
//  Copyright © 2020 Hiroaki_Hirabayashi. All rights reserved.
//

import SwiftUI

struct CategoryHome: View {
    
    //LandmarkData内の「category」をkeyにしてvalueをグループ化する
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarkData,
            by: { $0.category.rawValue}
        )
    }
    
    var featured: [Landmark] {
        landmarkData.filter { $0.isFeatured }
    }
    
    var body: some View {
        NavigationView {
            List {
                FeaturedLandmarks(landmarks: featured)
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets()) //端の余白をゼロにする
                
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: self.categories[key]!) //keyとなる値をテキストとしてリストに入れる
                }
                    .listRowInsets(EdgeInsets()) //端の余白をゼロにする
                
            }
            .navigationBarTitle("Featured")
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
    }
}

//「Featured」で表示される画像の設定
struct FeaturedLandmarks: View {
    var landmarks: [Landmark]
    var body: some View {
        landmarks[0].image.resizable()//表示されるランドマークの配列を指定
    }
}

