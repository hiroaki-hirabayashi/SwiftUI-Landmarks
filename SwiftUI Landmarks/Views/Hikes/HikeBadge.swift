//
//  HikeBadge.swift
//  SwiftUI Landmarks
//
//  Created by 平林宏淳 on 2020/12/24.
//  Copyright © 2020 Hiroaki_Hirabayashi. All rights reserved.
//

import SwiftUI

struct HikeBadge: View { //Badge.swiftの3分の1に縮小されたイメージ画像が表示される
    var name: String
    var body: some View {
        VStack(alignment: .center) {
            Badge()
                .frame(width: 300, height: 300)//元イメージの原寸大フレームで描画（レンダリング）
                .scaleEffect(1.0 / 3.0)        //原寸で表示したイメージを使いたい大きさに縮小 この場合は3分の1に縮小
                .frame(width:100, height: 100) //フレームの大きさをイメージに合わせて縮小 この場合はフレームを3分の1サイズに指定
            Text(name)
                .font(.caption)
                .accessibility(label: Text("Badge for \(name)."))
        }
    }
}

struct HikeBadge_Previews: PreviewProvider {
    static var previews: some View {
        HikeBadge(name: "Preview Testing")
    }
}
