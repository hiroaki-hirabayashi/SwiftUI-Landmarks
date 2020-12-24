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
    @State var draftProfile = Profile.default
    
    var body: some View {
    
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Spacer()
                EditButton() // 編集ボタン
            }
            ProfileSummary(profile: draftProfile)
        }
        .padding()
        
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
    }
}
