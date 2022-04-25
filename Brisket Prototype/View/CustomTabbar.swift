//
//  CustomTabbar.swift
//  Brisket Prototype
//
//  Created by Miles Belknap on 4/18/22.
//

import SwiftUI

struct CustomTabbar: View {
    @Binding var selectedTab : String
    
    var body: some View {

        HStack(){

            TabButton(title: "Posts", selectedTab: $selectedTab)

            TabButton(title: "Search", selectedTab: $selectedTab)
            
            TabButton(title: "CreatePost", selectedTab: $selectedTab)

            TabButton(title: "ForYou", selectedTab: $selectedTab)
            
            TabButton(title: "Settings", selectedTab: $selectedTab)

        }
        .padding()
        .padding(.top, -25)
        .background(Color("bg"))
    }
}

struct TabButton : View {
    
    var title : String
    @Binding var selectedTab : String
    @StateObject var postData = PostViewModel()
    
    var body: some View{
        Button(action: {selectedTab = title}) {
            
            VStack(){

                Image(title)
                    .renderingMode(.template)
                    .padding(.top, -300)
                
                if title == "Posts" {
                    Image(systemName: "house.fill")
                        .font(.title)
                }
                if title == "Search"{
                    Image(systemName: "magnifyingglass")
                        .font(.title)
                }
                if title == "CreatePost"{
                    Image(systemName: "plus.rectangle")
                        .font(.system(size: 45, weight: .bold, design: .default))

                }
                if title == "ForYou"{
                    Image(systemName: "play.square.fill")
                        .font(.title)
                }
                if title == "Settings"{
                    Image(systemName: "person.fill")
                        .font(.title)
                }
            }
            .foregroundColor(selectedTab == title ? Color("blue") : .gray)
            .padding(.horizontal)
            .padding(.vertical, 10)

        }
    }
}

