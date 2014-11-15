//
//  UserLocation.swift
//  DevelopHer2014
//
//  Created by Maricel Quesada on 11/14/14.
//  Copyright (c) 2014 Maricel-Betsy-Cindy-Alexa-Diana. All rights reserved.
//

import UIKit

class UserLocation {
    
    var latitude: Double!
    var longitude: Double!
    
    init() {
    }
    
    class var sharedInstance: UserLocation {
        struct Static {
            static let instance = UserLocation()
            
        }
        return Static.instance
    }
   
}
