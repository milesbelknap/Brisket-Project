//
//  Home.swift
//  Brisket Prototype
//
//  Created by Miles Belknap on 4/18/22.
//

import SwiftUI

struct Home: View {
    
    @State var selectedTab = "Posts"
    @StateObject var newPostData = NewPostModel()
    @StateObject var postData = PostViewModel()
    @State private var name = ""
    @State var isHidden = false
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)){
      
            //Custom tab Bar
            ZStack{
                
                PostView()
                    .opacity(selectedTab == "Posts" ? 1 : 0)
                
                SettingsView()
                    .opacity(selectedTab == "Settings" ? 1 : 0)

                NewPosts(updateId: $name).opacity(selectedTab == "CreatePost" ? 1 : 0)
            }
            
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            CustomTabbar(selectedTab: $selectedTab)
            
        }
        .background(Color("bg").ignoresSafeArea(.all, edges: .all))
        .ignoresSafeArea(.all, edges: .all)
    }
}



