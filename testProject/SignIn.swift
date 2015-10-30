//
//  SignIn.swift
//  testProject
//
//  Created by user on 29/10/15.
//  Copyright (c) 2015 user. All rights reserved.
//

class SignIn {
    var userName: String?
    var password: String?
    
    init(user: String, pass: String){
        self.userName = user
        self.password =  pass
        
    }
    
    func signInUser() -> Bool
    {
    if(hasEmptyFields() && checkUserCredintials())
    {
       return true
    }
        return false
        
        
    }
    
    
    func hasEmptyFields() -> Bool {
        if !userName!.isEmpty && !password!.isEmpty {
            return true
        }
        return false
    }
    
    func checkUserCredintials() -> Bool {
        PFUser.logInWithUsername(userName!, password: password!)
        if (PFUser.currentUser() != nil) {
           return true
        }
      
     return false
    }
    
}