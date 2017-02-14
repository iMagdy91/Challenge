//
//  UserViewModel.swift
//  Challenge
//
//  Created by Mohamed Magdy on 2/12/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import Foundation


class UserViewModel {
    
    var name: String?
    var username: String?
    var email: String?
    var address: String?
    var id: Int?
    
    init(name : String?, username: String?, email: String?, address: String?, id: Int?) {
        self.name = name
        self.username = username
        self.email = email
        self.address = address
        self.id = id
    }
    
}
