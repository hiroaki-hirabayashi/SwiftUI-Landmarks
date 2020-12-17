/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A representation of a single landmark.
*/

import Foundation
import SwiftUI
import CoreLocation
                                    //Identifiable 渡すデータをIdentifableに準拠したデータ型にする
struct Landmark: Hashable, Codable, Identifiable {

    //landmarkData.jsonの情報を配列で受け取る
    var name: String
    var category: Category
    var state: String
    var id: Int
    var park: String
    var description: String

    private var imageName: String
    var image: Image {
        Image(imageName)
    }

    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    enum Category: String, CaseIterable, Codable, Hashable  {
        case featured = "Featured"
        case likes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"

    }
}

//    extension Landmark {
//        var image: Image {
//            ImageStore.shared.image(name: imageName)
//        }
//    }

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }

//struct Landmark: Hashable, Codable, Identifiable {
//    var id: Int
//    var name: String
//    var park: String
//    var state: String
//    var description: String
//
//    private var imageName: String
//    var image: Image {
//        Image(imageName)
//    }
//
//    private var coordinates: Coordinates
//    var locationCoordinate: CLLocationCoordinate2D {
//        CLLocationCoordinate2D(
//            latitude: coordinates.latitude,
//            longitude: coordinates.longitude)
//    }
//
//    struct Coordinates: Hashable, Codable {
//        var latitude: Double
//        var longitude: Double
//    }
//}


/*  {}で囲まれた一つのデータ
     {
     "name": "Turtle Rock",
     "category": "Rivers",
     "city": "Twentynine Palms",
     "state": "California",
     "id": 1001,
     "isFeatured": true,
     "isFavorite": true,
     "park": "Joshua Tree National Park",
     "coordinates": {
         "longitude": -116.166868,
         "latitude": 34.011286
     },
     "description": "Suscipit inceptos est felis purus aenean aliquet adipiscing diam venenatis, augue nibh duis neque aliquam tellus condimentum sagittis vivamus, cras ante etiam sit conubia elit tempus accumsan libero, mattis per erat habitasse cubilia ligula penatibus curae. Sagittis lorem augue arcu blandit libero molestie non ullamcorper, finibus imperdiet iaculis ad quam per luctus neque, ligula curae mauris parturient diam auctor eleifend laoreet ridiculus, hendrerit adipiscing sociosqu pretium nec velit aliquam. Inceptos egestas maecenas imperdiet eget id donec nisl curae congue, massa tortor vivamus ridiculus integer porta ultrices venenatis aliquet, curabitur et posuere blandit magnis dictum auctor lacinia, eleifend dolor in ornare vulputate ipsum morbi felis. Faucibus cursus malesuada orci ultrices diam nisl taciti torquent, tempor eros suspendisse euismod condimentum dis velit mi tristique, a quis etiam dignissim dictum porttitor lobortis ad fermentum, sapien consectetur dui dolor purus elit pharetra. Interdum mattis sapien ac orci vestibulum vulputate laoreet proin hac, maecenas mollis ridiculus morbi praesent cubilia vitae ligula vel, sem semper volutpat curae mauris justo nisl luctus, non eros primis ultrices nascetur erat varius integer.",
     "imageName": "turtlerock"
 },

 */
