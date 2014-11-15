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
    

    @IBAction func connectToLinkedIn(sender: AnyObject) {
        User.loginWithCompletion { () -> Void in
            println("User logged in")
        }
    }
    @IBAction func sendInvitation(sender: AnyObject) {
        var data = Dictionary<String, String>()
        data["id"] = "1"
        data["firstName"] = "Alexandra"
        data["lastName"] = "Chakravarty"
        data["headline"] = ""
        data["pictureUrl"] = "https://media.licdn.com/mpr/mpr/shrink_200_200/p/2/005/00a/0d7/27fe2be.jpg"
        data["emailAddress"] = "alexa.chakravarty@gmail.com"
        data["industry"] = ""
        
        self.linkedInClient.sendInvitation(User(data: data), message: "Agregame por fa", success: { () -> Void in
            println("ok")
        }) { (error) -> Void in
            println("failed")
            println(error)
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
