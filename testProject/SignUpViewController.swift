//
//  SignUpViewController.swift
//  testProject
//
//  Created by user on 28/10/15.
//  Copyright (c) 2015 user. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate, UIAlertViewDelegate {

    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       firstName.delegate = self
        lastName.delegate = self
        userName.delegate = self
        userEmail.delegate = self
        password.delegate = self
        confirmPassword.delegate = self
        

      
    }

    @IBAction func signUpTouched(sender: UIButton) {
        errorLabel.text = ""
        let signUp = SignUp(fName: firstName.text!, lName: lastName.text!, uName: userName.text!, uEmail: userEmail.text!, pass: password.text!, confirm: confirmPassword.text!)
        
       signUp.signUpUser()
        signUp.storeSuccessfulSignUp()
        let alert = signUpSuccessAlert()
        presentViewController(alert, animated: true, completion: nil)
        
    }

    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func signUpSuccessAlert() -> UIAlertController {
        let alertView = UIAlertController(title: "Sign up Successful", message: "Now you can log in for complete access", preferredStyle: .Alert)
        alertView.addAction(UIAlertAction(title: "Log In", style: .Default, handler: {(alertAction) -> Void in self.dismissViewControllerAnimated(true, completion: nil)}))
        alertView.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        
        return alertView
    }



}
