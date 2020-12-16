//
//  MapView.swift
//  SwiftUI Landmarks
//
//  Created by 平林宏淳 on 2020/12/16.
//  Copyright © 2020 Hiroaki_Hirabayashi. All rights reserved.
//

import SwiftUI
import MapKit //地図を扱うフレームワーク

struct MapView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(latitude: 34.011286, longitude: -116.166868)//座標指定
        
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0) //マップ領域の高さと幅
        
        let region = MKCoordinateRegion(center: coordinate, span: span) // 座標の中心をcoordinate、表示範囲の大きさをspanとして表示領域を規定
        
        view.setRegion(region, animated: true)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
