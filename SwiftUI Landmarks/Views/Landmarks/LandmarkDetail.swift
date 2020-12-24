//
//  ContentView.swift
//  SwiftUI Landmarks
//
//  Created by 平林宏淳 on 2020/12/16.
//  Copyright © 2020 Hiroaki_Hirabayashi. All rights reserved.
//詳細画面

import SwiftUI

struct LandmarkDetail: View { // 詳細画面
    @EnvironmentObject var userData: UserData
    
    var landmarkDetail: Landmark
    
    var landmarkIndex: Int {
        userData.pubLandmarks.firstIndex(where: { $0.id == landmarkDetail.id })!
    }
    
    var body: some View {
        VStack {
            MapView(coordinate: landmarkDetail.locationCoordinate) //作成した地図を表示と高さ、セーフエリアを超えて表示
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300.0)
          
            CircleImage(image: landmarkDetail.image) //イメージ画像と位置
                .offset(y: -130)
                .padding(.bottom, -130.0)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(landmarkDetail.name)
                        .font(.title)
                    
                    //「お気に入り」を決めるボタンのアクション
                    Button(action: {
                        self.userData.pubLandmarks[self.landmarkIndex].isFavorite.toggle()
                        
                    }) {
                        if self.userData.pubLandmarks[self.landmarkIndex].isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        } else {
                            Image(systemName: "star")
                                .foregroundColor(.gray)
                        }
                    }
                    
                }
            
                HStack {
                    Text(landmarkDetail.park)
                        .font(.subheadline)
                    Spacer()
                    
                    Text(landmarkDetail.state)
                        .font(.subheadline)
                }

            }
            .padding()
            Spacer() //部品全体を上へ移動させる

        }
        .navigationBarTitle(Text(landmarkDetail.name), displayMode: .inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmarkDetail: landmarkData[0])
        .environmentObject(UserData())

    }
}
