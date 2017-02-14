//
//  UserModel.swift
//  Challenge
//
//  Created by Mohamed Magdy on 2/12/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import Foundation
import ObjectMapper

/* DTO */
class UserModel: Mappable {
    
    /* instance variables */
    var id: Int?
    var email: String?
    var name: String?
    var phone: String?
    var username: String?
    var website: String?
    var address: Address?
    var company: Company?
    
    required init?(map: Map) {
        
    }
    
    /* mapping from API */
    func mapping(map: Map) {
        id <- map["id"]
        email <- map["email"]
        name <- map["name"]
        phone <- map["phone"]
        username <- map["username"]
        website <- map["website"]
        address <- map["address"]
        company <- map["company"]
        
    }
    
}


/* DTO */
class Address: Mappable {
    
    /*instance variables */
    var street: String?
    var suite: String?
    var city: String?
    var zipcode: String?
    var geo: Geo?
    
    required init?(map: Map) {
        
    }
    /* mapping from API */
    func mapping(map: Map) {
        
        street <- map["street"]
        suite <- map["suite"]
        city <- map["city"]
        zipcode <- map["zipcode"]
        geo <- map["geo"]
        
    }
    
}

/* DTO */
class Company: Mappable {
    
    /*instance variables */
    var name: String?
    var catchPhrase: String?
    var bs: String?
    
    required init?(map: Map) {
        
    }
    
    /* mapping from API */
    func mapping(map: Map) {
        
        name <- map["name"]
        catchPhrase <- map["catchPhrase"]
        bs <- map["bs"]
    }
}

/* DTO */
class Geo: Mappable {
    
    /*instance variables */
    var lat: String?
    var long: String?
    
    
    required init?(map: Map) {
        
    }
    
    /* mapping from API */
    func mapping(map: Map) {
        lat <- map["lat"]
        long <- map["long"]
    }
}



