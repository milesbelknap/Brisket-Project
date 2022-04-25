//
//  UploadImage.swift
//  Brisket Prototype
//
//  Created by Miles Belknap on 4/14/22.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseStorage
import FirebaseAuth

func UploadImage(imageData: Data, path: String, completion: @escaping (String) -> ()){
    
    let storage = Storage.storage().reference()
    let uid = Auth.auth().currentUser!.uid
    let storageRef = storage.child(path).child(randomString(length: 8))
    
    let metaData = StorageMetadata()
        metaData.contentType = "image/jpeg"
    
    func randomString(length: Int) -> String {
      let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    storageRef.putData(imageData, metadata: metaData, completion: {(metaData, err) in
        if err != nil{
            completion("")
            return
            
        }
        //Downloading URL and Sending Back...
        storageRef.downloadURL(completion: {(url, err) in
            if err != nil {
                completion("")
                return
                
            }
            
            completion("\(url!)")
        })
    })
        
   
}
