//
//  ParseEvent.swift
//  CheckedIn
//
//  Created by Cindy Zheng on 10/27/14.
//  Copyright (c) 2014 Group6. All rights reserved.
//

import UIKit

class ParseInterest: PFObject,PFSubclassing {
    
    override class func load() {
        self.registerSubclass()
    }
    
    class  func  parseClassName() -> String! {
        return "InterestType"
    }
    override class func query() -> PFQuery! {
        return PFQuery(className: "InterestType")
    }
    
    
    var name:String? {
        get {return objectForKey("Name") as String? }
        set {setObject(newValue, forKey: "Name") }
    }
    var category : ParseCategory {
        get {return objectForKey("Categories") as ParseCategory}
        set {setObject(newValue, forKey: "Categories")}
    }

}