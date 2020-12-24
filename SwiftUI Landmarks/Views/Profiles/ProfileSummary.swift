//
//  ProfileSummary.swift
//  SwiftUI Landmarks
//
//  Created by 平林宏淳 on 2020/12/24.
//  Copyright © 2020 Hiroaki_Hirabayashi. All rights reserved.
//

import SwiftUI
//プロフィール概要
struct ProfileSummary: View {
    var profile: Profile
    
    static let goalFormat:DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()
    
    //ProfileSummary.swiftは、Profile.swiftの中にあるdefaultの値を読み込んでプレビューに表示
    var body: some View { 
        List {
            Text(profile.username)
                .bold()
                .font(.title)
            
            Text("Notifications: \(self.profile.prefersNotifications ? "On": "Off" )")
            
            Text("Seasonal Photos: \(self.profile.seasonalPhoto.rawValue)")
            
            Text("Goal Date: \(self.profile.goalDate, formatter: Self.goalFormat)")
            
            VStack(alignment: .leading) { //3つの色違いのBadge画像を作成して横並びに表示
                Text("Completed Badges")
                    .font(.headline)
                
                ScrollView(.horizontal) {
                    HStack {
                        HikeBadge(name: "First Hike")
                        HikeBadge(name: "Earth Day")
                            .hueRotation(Angle(degrees: 90)) //色相を90度回転
                        HikeBadge(name: "Tenth Hike")
                            .grayscale(0.5) //グレースケールの指定
                            .hueRotation(Angle(degrees: 45)) //色相を45度回転
                    }
                    .padding(.bottom)
                }
            }
            
            //グラフを表示
            VStack(alignment: .leading) {
                Text("Recent Hikes")
                    .font(.headline)
                
                HikeView(hike: ModelData().hikeData[0])
            }

        }
    }
}


struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
    }
}
