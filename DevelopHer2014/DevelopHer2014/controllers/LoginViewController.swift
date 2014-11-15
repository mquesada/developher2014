//
//  LoginViewController.swift
//  DevelopHer2014
//
//  Created by Maricel Quesada on 11/14/14.
//  Copyright (c) 2014 Maricel-Betsy-Cindy-Alexa-Diana. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    var linkedInClient: LinkedInClient!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.linkedInClient = LinkedInClient.sharedInstance
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onShowCategories(sender: AnyObject) {
        
    
    }
    @IBAction func onLogout(sender: UIButton) {
       
        User.currentUser?.logout()
     }

    @IBAction func onAddInterest(sender: AnyObject) {
    
    }
    
    @IBAction func connectToLinkedIn(sender: AnyObject) {
        User.loginWithCompletion { () -> Void in
            println("User logged in")
            self.performSegueWithIdentifier("LoginSegue", sender: self)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
