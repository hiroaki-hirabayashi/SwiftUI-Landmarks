//
//  ContentView.swift
//  SwiftUI Landmarks
//
//  Created by 平林宏淳 on 2020/12/16.
//  Copyright © 2020 Hiroaki_Hirabayashi. All rights reserved.
//

import SwiftUI

struct LandmarkDetail: View {
    var body: some View {
        VStack {
            MapView() //作成した地図を表示と高さ、セーフエリアを超えて表示
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300.0)
          
            CircleImage() //イメージ画像と位置
                .offset(y: -130)
                .padding(.bottom, -130.0)
            
            VStack(alignment: .leading) {
                Text("HelloWorld!!!!!!!!")
                    .font(.title)
            
                HStack {
                    Text(/*@START_MENU_TOKEN@*/"Joshua Tree National Park"/*@END_MENU_TOKEN@*/)
                        .font(.subheadline)
                    Spacer()
                    
                    Text("California")
                        .font(.subheadline)
                }

            }
            .padding()
            Spacer() //部品全体を上へ移動させる

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail()
    }
}
