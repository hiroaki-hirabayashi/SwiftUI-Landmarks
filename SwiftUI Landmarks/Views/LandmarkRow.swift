//
//  LandmarkRow.swift
//  SwiftUI Landmarks
//
//  Created by 平林宏淳 on 2020/12/17.
//  Copyright © 2020 Hiroaki_Hirabayashi. All rights reserved.
//

import SwiftUI

struct LandmarkRow: View {
    
    var landmark: Landmark //Landmark.swift経由でjsonデータを使う
    
    var body: some View {
        HStack {
            landmark.image
                .resizable() //画像のサイズ変更可能化
                .frame(width:50 , height: 50) //画像の大きさ指定
            Text(landmark.name)
            
            Spacer()
        }
    }
}

    struct LandmarkRow_Previews: PreviewProvider {
        static var previews: some View {
            Group {
                LandmarkRow(landmark: landmarkData[0])
                LandmarkRow(landmark: landmarkData[1])
            }
            .previewLayout(.fixed(width: 300, height: 70)) // プレビュー画像自体の大きさ指定

        }
    }
