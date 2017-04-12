//
//  Constants.swift
//  Ecommerce
//
//  Created by Kiran  Madhav  on 05/04/17.
//  Copyright © 2017 Technosoftcorp. All rights reserved.
//

import Foundation

struct Constants {
    
    struct URL {
        
        static let Base = "http://google.com"
    }
    
    struct Google {
        
        static let API_KEY = "AIzaSyDllO27zoqA2JXuSia98igvBNKeUmVN-d8"
        
        static let PLACES_API_BASE = "https://maps.googleapis.com/maps/api/place"
        
        static let TYPE_AUTOCOMPLETE = "/autocomplete"
        
        static let OUT_JSON = "/json";
        
        static let Base = PLACES_API_BASE + TYPE_AUTOCOMPLETE + OUT_JSON + "?key=" + API_KEY + "&types=(cities)&input="
    }
}
