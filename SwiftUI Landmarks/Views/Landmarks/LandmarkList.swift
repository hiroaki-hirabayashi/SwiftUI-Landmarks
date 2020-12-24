//
//  LandmarkList.swift
//  SwiftUI Landmarks
//
//  Created by 平林宏淳 on 2020/12/17.
//  Copyright © 2020 Hiroaki_Hirabayashi. All rights reserved.
//

import SwiftUI

struct LandmarkList: View { //一覧リスト画面
    @EnvironmentObject var userData: UserData //userDataでフィルタリング済の値

    var body: some View {
        
            List {
                Toggle(isOn: $userData.pubShowFavoritesOnly) {
                    Text("Favorite only")
                }
                ForEach(userData.pubLandmarks) { landmark in
                    if !self.userData.pubShowFavoritesOnly || landmark.isFavorite {
                        NavigationLink(destination: LandmarkDetail(landmarkDetail: landmark)) {
                            LandmarkRow(landmarkRow: landmark)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Landmarks"))
        
    }

}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LandmarkList()
                .environmentObject(UserData())
        } //userDataでフィルタリングされた値を示す

    }
}
