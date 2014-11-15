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
    
    
    var interests : [ParseInterest] {
        get {return objectForKey("InterestType") as [ParseInterest]}
        set {setObject(newValue, forKey: "InterestType")}
    }

    
}

