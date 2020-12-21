//
//  LandmarkList.swift
//  SwiftUI Landmarks
//
//  Created by 平林宏淳 on 2020/12/17.
//  Copyright © 2020 Hiroaki_Hirabayashi. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    @State var showFavoriteOnly = true
    
    var body: some View {
        
        NavigationView {
            List {
                Toggle(isOn: $showFavoriteOnly) {
                    Text("Favorite only")
                }
                ForEach(landmarkData) { landmark in
                    if !self.showFavoriteOnly || landmark.isFavorite {
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Landmarks"))
        }
        
    }

}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
