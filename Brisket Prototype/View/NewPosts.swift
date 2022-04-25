//
//  NewPosts.swift
//  Brisket Prototype
//
//  Created by Miles Belknap on 4/19/22.
//

import SwiftUI

struct NewPosts: View {
    @StateObject var newPostData = NewPostModel()
    @Environment(\.presentationMode) var present
    @Binding var updateId : String
    @State var selectedTab = ""

    var body: some View {

        VStack {
            
            HStack(spacing: 15){
                
                Button(action: {
                    self.updateId = ""
                    present.wrappedValue.dismiss()}) {
                    
                    Text("Cancel")
                        .fontWeight(.bold)
                        .foregroundColor(Color("blue"))
                }
                
                Spacer(minLength: 0)
                
                if updateId == ""{
                    
                    //only for new posts...
                    Button(action: {newPostData.picker.toggle()}) {
                        
                        Image(systemName: "photo.fill")
                            .font(.title)
                            .foregroundColor(Color("blue"))
                    }
                }
                
                Button(action: {newPostData.post(updateId: updateId, present: present)}) {
                    
                   Text("Post")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 25)
                        .background(Color("blue"))
                        .clipShape(Capsule())
                }
            }
            .padding()
            .opacity(newPostData.isPosting ? 0.5 : 1)
            .disabled(newPostData.isPosting ? true : false)
            
            TextEditor(text: $newPostData.postTxt)
                .cornerRadius(15)
                .padding()
                .opacity(newPostData.isPosting ? 0.5 : 1)
                .disabled(newPostData.isPosting ? true : false)
            
            //displaying image if selected...
                if newPostData.img_Data.count != 0{
                
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)){
                    
                    Image(uiImage: UIImage(data: newPostData.img_Data)!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width / 2, height: 150)
                        .cornerRadius(15)
                    
                    // cancel button...
                    Button(action: {newPostData.img_Data = Data(count: 0)}) {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color("blue"))
                            .clipShape(Circle())
                    }
                }
                .padding()
                .opacity(newPostData.isPosting ? 0.5 : 1)
                .disabled(newPostData.isPosting ? true : false)
            }
        }
        .background(Color("bg").ignoresSafeArea(.all, edges: .all))
        .sheet(isPresented: $newPostData.picker) {
            
            ImagePicker(picker: $newPostData.picker, img_Data: $newPostData.img_Data)
                .zIndex(10)
        }
    }
}


