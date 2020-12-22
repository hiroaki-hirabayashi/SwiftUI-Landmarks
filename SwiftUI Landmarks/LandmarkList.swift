//
//  LandmarkList.swift
//  SwiftUI Landmarks
//
//  Created by 平林宏淳 on 2020/12/17.
//  Copyright © 2020 Hiroaki_Hirabayashi. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var userData: UserData //userDataでフィルタリング済の値

    var body: some View {
        
        NavigationView {
            List {
                Toggle(isOn: $userData.pubShowFavoritesOnly) {
                    Text("Favorite only")
                }
                ForEach(userData.pubLandmarks) { landmark in
                    if !self.userData.pubShowFavoritesOnly || landmark.isFavorite {
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Landmarks"))
        }
        
    }

}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
        .environmentObject(UserData()) //userDataでフィルタリングされた値を示す

    }
}
