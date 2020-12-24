//
//  ProfileHost.swift
//  SwiftUI Landmarks
//
//  Created by 平林宏淳 on 2020/12/24.
//  Copyright © 2020 Hiroaki_Hirabayashi. All rights reserved.
//

import SwiftUI
//プロフィール画面
struct ProfileHost: View {
    
    @Environment(\.editMode) var mode // 編集モードのビュー属性を追加
    @EnvironmentObject var userData: UserData //UserDataの制御をProfileHostに渡す。プロフィール編集モードの非同期処理を有効に
    @State var draftProfile = Profile.default//編集したデータ
    
    var body: some View {
    
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                //キャンセルボタン
                if self.mode?.wrappedValue == .active {
                    Button("Cancel") {
                        self.draftProfile = self.userData.profile //キャンセルが押されたら元に戻す
                        self.mode?.animation().wrappedValue = .inactive
                    }
                }
                
                Spacer()
                EditButton() // 編集ボタン
            }
            ProfileSummary(profile: draftProfile)
        //Editボタンを押す前（編集モードが非アクティブ）の状態ではProfileSummaryが表示、それ以外（編集モードがアクティブ）の時は「Profile Editor」の文字列が表示
        if self.mode?.wrappedValue == .inactive { //編集モードではない時
            ProfileSummary(profile: userData.profile) //既存のプロフィールを表示
        } else { //編集モードの場合
            ProfileEditor(profile: $draftProfile)
                .onAppear { //編集モードでプロフィールエディタを表示している時
                    //下書きに既存のプロフィールを表示
                    self.draftProfile = self.userData.profile
            }
            .onDisappear { //編集モードを閉じる時
                //下書きを本番に書き換える
                self.userData.profile = self.draftProfile
            }
        }
      }
        .padding()
        
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost().environmentObject(UserData())

    }
}
