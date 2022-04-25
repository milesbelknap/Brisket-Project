//
//  PostRow.swift
//  Brisket Prototype
//
//  Created by Miles Belknap on 4/19/22.
//

import SwiftUI
import SDWebImageSwiftUI
import Firebase

struct PostRow: View {
    
    var post : PostModel
    @ObservedObject var postData : PostViewModel
    let uid = Auth.auth().currentUser!.uid
    
    var body: some View {

        VStack(){

            if post.pic != "" {
                
                ZStack{
                WebImage(url: URL(string: post.pic))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 800)
                    
                    HStack(){
                                        
                        Spacer(minLength: 0)
                        
                        VStack(){
                                                        
                        //displaying only posted user...
                        if post.user.uid == uid {
                            
                            Menu(content: {
                                
                                Button(action: {postData.editPost(id: post.id)}) {
                                    Text("Edit")
                                }

                                Button(action: {postData.deletePost(id: post.id)}) {
                                    Text("Delete")
                                }
                                
                            }, label: {
                                
                                Image(systemName: "ellipsis")
                                    .renderingMode(.template)
                                    .resizable()
                                    .frame(width: 12, height: 3)
                                    .foregroundColor(.white)
                                    .padding(.trailing, 10)
                                    .padding(.top, 10)
                            })
                            
                            Spacer(minLength: 0)

                        }
                    }
                }
                    
                    VStack(){
                        
                        Spacer(minLength: 0)
                        
                        HStack{
                                            
                            HStack{
                                
                                WebImage(url: URL(string: post.user.pic)) //displays the profile pic of whoever posted
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 35, height: 35)
                                    .clipShape(Circle())
                                    .padding(.leading, 10)
                                
                                //post icons
                                Text(post.user.username)   //displays the username of whoever posted
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                
                                Spacer()

                            }
                    }
                        .padding(.bottom, -10)
                        HStack{

                            Text(post.title) //displays the posts' caption
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.leading, 10)
                            
                            Spacer(minLength: 0)
                        
                                .padding(.top, 5)
                            
                            Spacer(minLength: 0)
                            
                            Button(action: {
    
                            }) {
                                    Image(systemName: "arrowshape.turn.up.right.fill")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .padding(.trailing, 10)
                                    .padding(.bottom, 10)
              }
           }
         }
       }
     }
   }
 }
}
