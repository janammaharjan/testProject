//
//  SignUp.swift
//  testProject
//
//  Created by user on 28/10/15.
//  Copyright (c) 2015 user. All rights reserved.
//

class SignUp: NSObject {
    var firstName: String?
    var lastName: String?
    var userName: String?
    var userEmail: String?
    var password: String?
    var confirmPassword: String?
    
    
    init(fName: String, lName: String, uName: String, uEmail: String, pass: String, confirm: String){
        
        self.firstName = fName
        self.lastName = lName
        self.userName = uName
        self.userEmail = uEmail
        self.password = pass
        self.confirmPassword = confirm
        
    }
    
    
    
    
}