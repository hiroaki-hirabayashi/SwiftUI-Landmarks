//
//  LandmarkRow.swift
//  SwiftUI Landmarks
//
//  Created by 平林宏淳 on 2020/12/17.
//  Copyright © 2020 Hiroaki_Hirabayashi. All rights reserved.
//

import SwiftUI

struct LandmarkRow: View { //一覧リスト画面の行
    
    var landmarkRow: Landmark //Landmark.swift経由でjsonデータを使う
    
    var body: some View {
        HStack {
            landmarkRow.image
                .resizable() //画像のサイズ変更可能化
                .frame(width:50 , height: 50) //画像の大きさ指定
            Text(landmarkRow.name)
            Spacer()
            
            //もしお気に入り（Favorite）のランドマークだったら黄色いスター（中サイズ）が表示される
            if landmarkRow.isFavorite {
                Image(systemName: "star.fill") //スターのイメージ
                    .imageScale(.medium) // イメージの大きさ
                    .foregroundColor(.yellow) // イメージの色
            }
            
        }
    }
}

    struct LandmarkRow_Previews: PreviewProvider {
        static var previews: some View {
            Group {
                LandmarkRow(landmarkRow: landmarkData[0])
                LandmarkRow(landmarkRow: landmarkData[1])
            }
            .previewLayout(.fixed(width: 300, height: 70)) // プレビュー画像自体の大きさ指定

        }
    }
