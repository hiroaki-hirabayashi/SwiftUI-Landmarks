//
//  ContentView.swift
//  SwiftUI Landmarks
//
//  Created by 平林宏淳 on 2020/12/16.
//  Copyright © 2020 Hiroaki_Hirabayashi. All rights reserved.
//

import SwiftUI

struct LandmarkDetail: View {
    
    var landmark: Landmark
    
    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate) //作成した地図を表示と高さ、セーフエリアを超えて表示
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300.0)
          
            CircleImage(image: landmark.image) //イメージ画像と位置
                .offset(y: -130)
                .padding(.bottom, -130.0)
            
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
            
                HStack {
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer()
                    
                    Text(landmark.state)
                        .font(.subheadline)
                }

            }
            .padding()
            Spacer() //部品全体を上へ移動させる

        }
        .navigationBarTitle(Text(landmark.name), displayMode: .inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarkData[0])
    }
}
