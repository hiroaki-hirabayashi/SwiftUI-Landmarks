//
//  ProfileHost.swift
//  SwiftUI Landmarks
//
//  Created by 平林宏淳 on 2020/12/24.
//  Copyright © 2020 Hiroaki_Hirabayashi. All rights reserved.
//

import SwiftUI

struct ProfileHost: View {
    
    @State var draftProfile = Profile.default
    
    var body: some View {
    
        VStack(alignment: .leading, spacing: 20) {
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
