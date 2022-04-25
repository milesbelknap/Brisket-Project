//
//  LoginViewModel.swift
//  Brisket Prototype
//
//  Created by Miles Belknap on 4/12/22.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseStorage
import FirebaseAuth

class LoginViewModel : ObservableObject{
    
    @Published var code = ""
    @Published var number = ""
    
    //For any errors...
    @Published var errorMsg = ""
    @Published var error = false
    
    @Published var registerUser = false
    @AppStorage("current_status") var status = false
    
    //Loading when searches for user...
    @Published var isLoading = false
    
    func verifyUser(){
        
        isLoading = true
        
        //Remove when testing in live
        Auth.auth().settings?.isAppVerificationDisabledForTesting = true
        
        let phoneNumber = "+" + code + number
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) {
            (ID, err) in
            
            if err != nil {
                self.errorMsg = err!.localizedDescription
                self.error.toggle()
                self.isLoading = false
                return
            }
            
            //code sent successfully...
            
            alertView(msg: "Enter Verification Code") {  (Code) in
                
                let credential =
                PhoneAuthProvider.provider().credential(withVerificationID: ID!, verificationCode: Code)
                
                Auth.auth().signIn(with: credential) { (res, err) in
                    
                    if err != nil {
                        self.errorMsg = err!.localizedDescription
                        self.isLoading = false
                        self.error.toggle()
                        return
                    }
                    
                    self.checkUser()
                }
            }
        }
    }
  
    func checkUser(){
        
        let ref = Firestore.firestore()
        let uid = Auth.auth().currentUser!.uid
        
        ref.collection("Users").whereField("uid", isEqualTo: uid).getDocuments {
            (snap, err) in
            
            if err != nil {
                //No Documents...
                //No User Found...
                self.registerUser.toggle()
                self.isLoading = false
                return
            }
            
            if snap!.documents.isEmpty{
                
                self.registerUser.toggle()
                self.isLoading = false
                return
            }
            self.status = true
        }
    }
}

