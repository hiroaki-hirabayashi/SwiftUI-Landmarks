//
//  ProfileEditor.swift
//  SwiftUI Landmarks
//
//  Created by 平林宏淳 on 2020/12/24.
//  Copyright © 2020 Hiroaki_Hirabayashi. All rights reserved.
//

import SwiftUI

struct ProfileEditor: View {
    
    @Binding var profile: Profile
     //Dateピッカー(日付)の表示設定
    var dataRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max =  Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        
        return min...max
    }
    
    var body: some View {
        List {
            HStack {
                Text("Username").bold() //タイトル
                Divider() //仕切り線
                TextField("Username", text: $profile.username) //ユーザー名usernameの表示、編集欄
            }
            
            Toggle(isOn: $profile.prefersNotifications) { //通知の可否を設定するToggle
                Text("Enable Notifications")
            }
            //セグメントコントロール
            VStack(alignment: .leading, spacing: 20) {
                Text("Seasonal Photo").bold() //セグメントコントロールのタイトル
                //profile.swiftのSeasonを元にpickerを生成する
                Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases, id: \.self) { season in
                        Text(season.rawValue).tag(season)
                    }
                }
                    .pickerStyle(SegmentedPickerStyle()) //pickerの型指定（セグメントコントロール）
            }
            .padding(.top)
            //Dateピッカー
            VStack(alignment: .leading, spacing: 20){
                Text("Goal Date").bold() //Dateピッカーのタイトル
                DatePicker("Goal Date", //LocalizedStringkey
                           selection:  $profile.goalDate,
                           in: dataRange,
                           displayedComponents: .date)
            }
            .padding(.top)
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
