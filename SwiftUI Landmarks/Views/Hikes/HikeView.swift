/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view displaying information about a hike, including an elevation graph.
*/

import SwiftUI

//extension AnyTransition {
//    static var moveAndFade: AnyTransition {
//        let insertion = AnyTransition.move(edge: .trailing)
//            .combined(with: .opacity)
//        let removal = AnyTransition.scale
//            .combined(with: .opacity)
//        return .asymmetric(insertion: insertion, removal: removal)
//    }
//}

struct HikeView: View {
    var hike: Hike
    @State private var showDetail = false

    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)
                    .animation(nil)

                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }

                Spacer()

                Button(action: {
                    withAnimation {
                        self.showDetail.toggle()
                    }
                    
                }) {
                    Image(systemName: "chevron.right.circle")
                        .imageScale(.large) //イメージの大きさ
                        .rotationEffect(.degrees(showDetail ? 90 : 0)) // 回転角度
                        .scaleEffect(showDetail ? 1.5 : 1) //一覧と詳細で大きさの切り替え
                        .padding()
                        .animation(.easeInOut) //アニメーション効果

                }
            }

            if showDetail {
                HikeDetail(hike: hike)
//                    .transition(.moveAndFade)
            }
        }
    }
}

struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HikeView(hike: ModelData().hikes[0])
                .padding()
            Spacer()
        }
    }
}

