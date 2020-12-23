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
    
    var body: some View {
        NavigationView {
            List {
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: self.categories[key]!) //keyとなる値をテキストとしてリストに入れる
                }
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
