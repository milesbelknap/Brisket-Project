//
//  RegisterViewModel.swift
//  Brisket Prototype
//
//  Created by Miles Belknap on 4/14/22.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseStorage
import FirebaseAuth

class RegisterViewModel : ObservableObject{
    
    @Published var name = ""
    @Published var bio = ""
    
    @Published var image_Data = Data(count: 0)
    @Published var picker = false
    let ref = Firestore.firestore()
    //loading view...
    @Published var isLoading = false
    @AppStorage("current_status") var status = false
    
    func register() {
        
        isLoading = true
        //setting user data to firestore...
        let uid = Auth.auth().currentUser!.uid
        
        UploadImage(imageData: image_Data, path: "profile_Photos"){ (url) in
            
            self.ref.collection("Users").document(uid).setData([
            
                "uid": uid,
                "imageurl": url,
                "username": self.name,
                "bio": self.bio,
                "dateCreated": Date()
                
            ]) { (err) in

                if err != nil {
                    self.isLoading = false
                    return
                }
                self.isLoading = false
                // success means settings status as true...
                self.status = true
            }
        }
    }
}
