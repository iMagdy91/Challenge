//
//  UserStore.swift
//  Challenge
//
//  Created by Mohamed Magdy on 2/12/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import Foundation
import ObjectMapper

class UserStore {
    
    /* handling the users request */
    class func getUsers(success: @escaping ([UserViewModel]) -> Void, failure: @escaping (Error) -> Void) {
       
        
        NetworkManager.performRequestWithPath(path: NetworkStruct.userPath, requestMethod: .get, parameters: nil, headers: nil, success: { (response) in
            
            let users: Array<UserModel>? = Mapper<UserModel>().mapArray(JSONObject: response)
            var usersViewModel = [UserViewModel]()
            if let usersArray = users {
                for user in usersArray {
                    let address = user.address!.street! + "," + user.address!.suite! + user.address!.city! + ". " + user.address!.zipcode!
                    let userViewModel = UserViewModel.init(name: user.name, username: user.username, email: user.email, address: address, id: user.id)
                    usersViewModel.append(userViewModel)
                }
                success(usersViewModel)
            }
            
        }) { (error) in
            failure(error)
        }
        
    }
    
}
