//
//  UserData.swift
//  SwiftUI Landmarks
//
//  Created by 平林宏淳 on 2020/12/21.
//  Copyright © 2020 Hiroaki_Hirabayashi. All rights reserved.
//

import SwiftUI
import Combine  //値を監視して仕分けや型の変更を行えるフレームワーク


final class UserData: ObservableObject  {//Combineフレームワークで扱える型に値を変更するクラス
    
    @Published var pubShowFavoritesOnly = false
    @Published var pubLandmarks = landmarkData
    
}
