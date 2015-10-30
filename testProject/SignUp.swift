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
    
    func signUpUser() -> Bool {
       
            return true
        
        
            
        
    }
    
    func hasEmptyFields() -> Bool {
        if !firstName!.isEmpty && !lastName!.isEmpty && !userName!.isEmpty && !userEmail!.isEmpty && !password!.isEmpty && !confirmPassword!.isEmpty
        {
            return true
        }
        return false
    }
    
    func isValidEmail() -> Bool {
        let emailEX = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]"
        let range = userEmail!.rangeOfString(emailEX, options: .RegularExpressionSearch)
        let result = range != nil ? true : false
        return result
    }
    
    func validatePasswordMatch() -> Bool {
        if(password! == confirmPassword!)
        {
            return true
        }
        return false
    }
    
    func checkPasswordSufficientComplexity() -> Bool {
        let capitalLetterRegEx = ".*[A-Z]+.*"
        let textTest = NSPredicate(format: "SELF MATCHES %@", capitalLetterRegEx)
        let capitalResult = textTest.evaluateWithObject(password!)
        println("Capital Letter: \(capitalResult)")
        
        let numberRegEx = ".*[0-9]+.*"
        let textTest2 = NSPredicate(format: "SELF MATCHES %@", numberRegEx)
        let numberResult = textTest2.evaluateWithObject(password!)
        println("Numbers Included: \(numberResult)")
        
        let lengthResult = count(password!) >= 8
        println("Password Length: \(lengthResult)")
        
        return capitalResult && numberResult && lengthResult
        
        
    }
    
    func storeSuccessfulSignUp() -> Bool {
        var success = false
        var user = PFUser()
        
        user["FirstName"] = firstName!
        user["LastName"] = lastName!
        user.username = userName!
        user.email = userEmail!
        user.password = password!
        
        user.signUp()
        
        success = user.isNew
        return success
    }
    
    
    
}