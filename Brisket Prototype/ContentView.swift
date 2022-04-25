//
//  ContentView.swift
//  Brisket Prototype
//
//  Created by Miles Belknap on 3/28/22.
//

import SwiftUI
import AVKit
import FirebaseStorage
import FirebaseFirestore
import Firebase
import FirebaseAuth

struct ContentView: View {
    @AppStorage("current_status") var status = false
    var body: some View {
        
        NavigationView{

            VStack{

                if status{Home()}
                else{Login()}
            }
            .preferredColorScheme(.dark)
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack() {
            ContentView()
        }
    }
}

//struct PlayerView : View {
//
//    @Binding var data : [Video]
//
//    var body: some View {
//
//        VStack(spacing: 0) {
//
//            ForEach(0..<self.data.count) {i in
//
//                ZStack {
//                    Player(player: self.data[i].player)
//                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//                        .offset(y: -7)
//
//                    if self.data[i].replay{
//                        Button(action: {
//                            //comeback and delete the button and make the video just replay on its own without needing user attention.
//                            //playing the video again
//                            self.data[i].replay = false
//                            self.data[i].player.seek(to: .zero)
//                            self.data[i].player.play()
//                        }) {
//                            Image(systemName: "goforward")
//                            .resizable()
//                            .frame(width: 55, height: 60)
//                            .foregroundColor(.white)
//                        }
//                    }
//                }
//            }
//        }
//        .onAppear{
//            self.data[0].player.play()
//
//            self.data[0].player.actionAtItemEnd = .none
//            NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.data[0].player.currentItem, queue: .main) {  (_) in
//
//                //enabling replay button
//                self.data[0].replay = true        }
//    }
//}
//
//struct Player : UIViewControllerRepresentable {
//
//    var player : AVPlayer
//
//    func makeUIViewController(context: Context) -> AVPlayerViewController {
//        let view = AVPlayerViewController()
//        view.player = player
//        view.showsPlaybackControls = false
//        view.videoGravity = .resizeAspectFill
//        return view
//    }
//
//    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
//
//    }
//
//}
//
//class Host : UIHostingController<ContentView> {
//
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//
//        return .lightContent
//    }
// }
//}
//
//// sample video content...
//struct Video : Identifiable {
//
//    var id : Int
//    var player : AVPlayer
//    var replay : Bool
//}
//
//struct PlayerScrollView : UIViewRepresentable {
//
//    func makeCoordinator() -> Coordinator {
//
//        return PlayerScrollView.Coordinator(parent1: self)
//    }
//
//    @Binding var data : [Video]
//
//    func makeUIView(context: Context) -> UIScrollView {
//
//        let view = UIScrollView()
//
//        let childView = UIHostingController(rootView: PlayerView(data: self.$data))
//
//        childView.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((data.count)))
//
//        view.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((data.count)))
//
//        view.addSubview(childView.view)
//        view.showsVerticalScrollIndicator = false
//        view.showsHorizontalScrollIndicator = false
//
//        view.contentInsetAdjustmentBehavior = .never
//        view.isPagingEnabled = true
//        view.delegate = context.coordinator
//
//        return view
//    }
//
//    func updateUIView(_ uiView: UIScrollView, context: Context) {
//        uiView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((data.count)))
//
//        for i in 0..<uiView.subviews.count{
//
//            uiView.subviews[i].frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((data.count)))
//        }
//    }
//
//    class Coordinator : NSObject, UIScrollViewDelegate {
//
//        var parent : PlayerScrollView
//        var index = 0
//
//        init(parent1 : PlayerScrollView){
//
//            parent = parent1
//        }
//
//        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//
//            let currentindex = Int(scrollView.contentOffset.y / UIScreen.main.bounds.height)
//
//            if index != currentindex{
//
//                index = currentindex
//            }
//                //pausing all other tutorials
//                for i in 0..<parent.data.count{
//
//                    parent.data[i].player.seek(to: .zero)
//                    parent.data[i].player.pause()
//                }
//
//                //playing next video
//                parent.data[index].player.play()
//
//                parent.data[index].player.actionAtItemEnd = .none
//                NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: parent.data[index].player.currentItem, queue: .main) {  (_) in
//
//                //notification to identify at the end of the video
//
//                    //enabling replay button
//                    self.parent.data[self.index].replay = true
//                }
//            }
//        }
//    }

