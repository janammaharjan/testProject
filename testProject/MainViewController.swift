//
//  MainViewController.swift
//  testProject
//
//  Created by user on 28/10/15.
//  Copyright (c) 2015 user. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        let currentUser = PFUser.currentUser()
        if currentUser != nil
        {
            //do something
        }
        
        else
        {
            self.performSegueWithIdentifier("goSignin", sender: self)
        }
        
        
    }

    @IBAction func logOutUser(sender: UIButton) {
        
        PFUser.logOut()
        self.performSegueWithIdentifier("goSignin", sender: self)
    }


}
