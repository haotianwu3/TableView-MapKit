//
//  Shops.swift
//  TableView&MapKit
//
//  Created by Randolph on 13/1/2016.
//  Copyright © 2016年 September. All rights reserved.
//

import UIKit

class Shop{
    var Name: String
    var ShopLatitude: Double
    var ShopLongitude: Double
    
    
    init?(name:String, latitude: Double, longitude: Double){
        self.Name = name
        self.ShopLatitude = latitude
        self.ShopLongitude = longitude
        
        if (name.isEmpty || latitude.isNaN || longitude.isNaN) {
            return nil
        }
    }
    
}
