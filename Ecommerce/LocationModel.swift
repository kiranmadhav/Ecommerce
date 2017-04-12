//
//  LocationModel.swift
//  Ecommerce
//
//  Created by Kiran  Madhav  on 06/04/17.
//  Copyright © 2017 Technosoftcorp. All rights reserved.
//

import Foundation

class LocationModel {
    
    var locID : String?
    
    var locName : String?
    
    init?(rawData:NSDictionary) {
        
        guard let locName = rawData["description"] as? String else  {
            return nil
        }
        
        guard let locID = rawData["place_id"] as? String else  {
            return nil
        }
        
        self.locName = locName
        
        self.locID = locID;
    }
    
    init?(name:String, id:String) {
        
        self.locName = name
        
        self.locID = id;
    }
}


