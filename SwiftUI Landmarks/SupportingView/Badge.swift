//
//  Badge.swift
//  SwiftUI Landmarks
//
//  Created by 平林宏淳 on 2020/12/23.
//  Copyright © 2020 Hiroaki_Hirabayashi. All rights reserved.
//

import SwiftUI

struct Badge: View {
    static let rotationCount = 8 //表示するシンボルの数
    
    var badgeSymbols: some View {
        ForEach(0..<Badge.rotationCount) { i in  //  0から7までの数を代入して角度を決める
            RotatedBadgeSymbol(
                angle: .degrees(Double(i) / Double(Badge.rotationCount)) * 360.0
            )
        }
            .opacity(0.5) //透過率
    }
    
    var body: some View {
        
        ZStack {
            BadgeBackground() //バッジの背景画像
            //            self.badgSymbol //回転するシンボル画像（背景画像の上に重なる）
            
            GeometryReader { geometry in
                self.badgeSymbols //親ビューをもとに相対的に座標空間の値を返す//回転するシンボル画像
                    .scaleEffect(1.0 / 4.0, anchor: .top) //大きさを縮小
                    
                    .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height) //画像の配置を指定
            }
        }
        .scaledToFill()
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
