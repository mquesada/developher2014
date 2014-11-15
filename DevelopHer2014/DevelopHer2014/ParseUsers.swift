//
//  ParseUser.swift
//  CheckedIn
//
//  Created by Cindy Zheng on 10/27/14.
//  Copyright (c) 2014 Group6. All rights reserved.
//

import UIKit

class ParseUser:  PFUser,PFSubclassing {
    
    override class func load() {
        self.registerSubclass()
    }
    
    var name :String? {
        get {return objectForKey("Name") as String?}
        set {setObject(newValue, forKey: "Name")}
    }
    var firstName :String? {
        get {return objectForKey("FirstName") as String?}
        set {setObject(newValue, forKey: "FirstName")}
    }
    var lastName :String? {
        get {return objectForKey("LastName") as String?}
        set {setObject(newValue, forKey: "LastName")}
    }
    var headline :String? {
        get {return objectForKey("HeadLine") as String?}
        set {setObject(newValue, forKey: "HeadLine")}
    }

    var profileImageUrl :String? {
        get {return objectForKey("profileImageURL") as String?}
        set {setObject(newValue, forKey: "profileImageURL")}
    }

    var Indurstry :String? {
        get {return objectForKey("Indurstry") as String?}
        set {setObject(newValue, forKey: "Indurstry")}
    }
    var interests : [ParseInterest] {
        get {return objectForKey("InterestType") as [ParseInterest]}
        set {setObject(newValue, forKey: "InterestType")}
    }
    
    
}

