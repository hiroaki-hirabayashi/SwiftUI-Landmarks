//
//  CircleImage.swift
//  SwiftUI Landmarks
//
//  Created by 平林宏淳 on 2020/12/16.
//  Copyright © 2020 Hiroaki_Hirabayashi. All rights reserved.
//

import SwiftUI

struct CircleImage: View { // 詳細画面の写真
    var image: Image
    
    var body: some View {
        image
        .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: 4)
            .shadow(radius: 5)
        )
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
