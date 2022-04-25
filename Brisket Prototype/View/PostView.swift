//
//  PostView.swift
//  Brisket Prototype
//
//  Created by Miles Belknap on 4/18/22.
//

import SwiftUI
import AVKit

struct PostView: View {
    
    @StateObject var postData = PostViewModel()
    @State var index = 0
//    @State var top = 0
//    @State var data = [
//            Video(id: 0, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "pexels-anastasia-shuraeva-5704989", ofType: "mp4")!)), replay: false),
//            Video(id: 1, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "pexels-宇航-钱-10641436", ofType: "mp4")!)), replay: false),
//            Video(id: 2, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "pexels-artem-podrez-7049271", ofType: "mp4")!)), replay: false),
//            Video(id: 3, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "pexels-宇航-钱-8871287", ofType: "mp4")!)), replay: false),
//            Video(id: 4, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "pexels-rulo-davila-5380467", ofType: "mp4")!)), replay: false)
//        ]
    
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    var body: some View {

        VStack{
            
            HStack{
                
                Text("Posts")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                Spacer(minLength: 0)
                
                Button(action: {postData.newPost.toggle()}) {
                    Image(systemName: "square.and.pencil")
                        .font(.title)
                        .foregroundColor(.white)
                }
            }
            .padding()
            .padding(.top, edges!.top)
            //top shadow effect...
            .background(Color("bg"))
            .shadow(color: Color.white.opacity(0.06), radius: 5, x: 0, y: 5)
            
            if postData.posts.isEmpty{
                
                Spacer(minLength: 0)
                
                if postData.noPosts{
                    
                    Text("No Posts !!!")
                }
                else {
                    
                    ProgressView()
                }
                
                Spacer(minLength: 0)
            }
            else{
                
                ScrollView{
                    
                    VStack(spacing: 15){
                        
                        ForEach(postData.posts){ post in
                            
                            PostRow(post: post, postData: postData)
                        }
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $postData.newPost) {
            
            NewPosts(updateId : $postData.updateId)
        }
    }
}


