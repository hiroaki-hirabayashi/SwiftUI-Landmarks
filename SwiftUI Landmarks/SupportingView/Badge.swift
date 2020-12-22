//
//  Badge.swift
//  SwiftUI Landmarks
//
//  Created by 平林宏淳 on 2020/12/22.
//  Copyright © 2020 Hiroaki_Hirabayashi. All rights reserved.
//

import SwiftUI

struct Badge: View {
    var body: some View {
       
        
        GeometryReader { geometry in
            Path { path in
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
     //六角形の大きさ
                let height = width
                let xScale: CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale)) / 2.0
                width *= xScale

                path.move(
                    to: CGPoint(
                        x: xOffset + width * 0.95,
                        y: height * (0.20 + HexagonParameters.adjustment) //線画の開始地点
                    )
                )
                
                HexagonParameters.segments.forEach { segment in
                    path.addLine(
                        to: .init(
                            x: width * segment.line.x + xOffset,
                            y: height * segment.line.y
                        )
                    )
                    
                    path.addQuadCurve(
                    to: .init(
                        x: width * segment.curve.x + xOffset,
                        y: height * segment.curve.y
                    ),
                    control: .init(
                        x: width * segment.control.x + xOffset,
                        y: height * segment.control.y
                        )
                    )
                }
            }
            .fill(LinearGradient(
                gradient: .init(colors: [Self.gradientStart, Self.gradientEnd]),
                startPoint: .init(x: 0.5, y: 0),
                endPoint: .init(x: 0.5, y: 0.6)
            )) //図形の色をグラデーションにする
                .aspectRatio(1, contentMode: .fit) //画面の中央に表示

        }
    }
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255) //図形の色をグラデーションにする

}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
