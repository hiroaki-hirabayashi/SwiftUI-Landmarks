//
//  CategoryHome.swift
//  SwiftUI Landmarks
//
//  Created by 平林宏淳 on 2020/12/23.
//  Copyright © 2020 Hiroaki_Hirabayashi. All rights reserved.
//

import SwiftUI

struct Home: View { // ホーム画面
    
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
    
    @State var showingProfile = false
    @EnvironmentObject var userData: UserData

    //ユーザープロファイルへのリンクボタンの設定
    var profileButton: some View {
        Button(action: { self.showingProfile.toggle()}) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
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
                NavigationLink(destination: LandmarkList()) {
                    Text("一覧画面へ") // LandmarkListへのリンク
                }
                
            }
            .navigationBarTitle("Featured")
                .navigationBarItems(trailing: profileButton)//ナビゲーションバーにプロフィールボタンを追加
                
                .sheet(isPresented: $showingProfile) { //ユーザープロファイルシートを設定
                    ProfileHost()
                        .environmentObject(self.userData) //ボタンをタップするとProfileHostで作ったビューを表示する
            }
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

//「Featured」で表示される画像の設定
struct FeaturedLandmarks: View {
    var landmarks: [Landmark]
    var body: some View {
        landmarks[0].image.resizable()//表示されるランドマークの配列を指定
    }
}

