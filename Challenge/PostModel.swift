//
//  PostModel.swift
//  Challenge
//
//  Created by Mohamed Magdy on 2/12/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import Foundation
import ObjectMapper

class PostModel: Mappable {
   
    var body: String?
    var id: Int?
    var title: String?
    var userID: Int?
    
    
    required init?(map: Map) {
        id <- map["id"]
        body <- map["body"]
        title <- map["title"]
        userID <- map["userId"]

    }
    
    /* mapping from API */
    func mapping(map: Map) {
       
        
    }
    
}
